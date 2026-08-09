import 'dart:io';

import 'package:yaml/yaml.dart';

/// Enforces barrel-only access to shared layers **and** pub packages.
///
/// Allowed:
/// - `lib/barrels/*_barrel.dart` (includes `package_exports`)
/// - same-feature relatives (`features/<this>/...`)
/// - same barreled-root relatives
/// - `dart:` SDK imports
/// - `package:` imports **only inside** barreled roots / barrel `files:` (dependency ownership)
///
/// Forbidden outside owning barreled roots:
/// - direct `package:...` imports (add to a barrel `package_exports`, then import that barrel)
/// - reaching into another barreled root
/// - cross-feature imports (features have no barrel)
///
/// Override one import:
/// ```dart
/// // ignore: only_barrel_imports
/// import '../../auth/data/auth_session.dart';
/// ```
///
/// Or a whole file:
/// ```dart
/// // ignore_for_file: only_barrel_imports
/// ```
class BarrelImportLinter {
  BarrelImportLinter({Directory? projectRoot}) : root = projectRoot ?? _findProjectRoot();

  static const ruleId = 'only_barrel_imports';

  final Directory root;

  late final String _packageName;
  late final List<String> _barreledRoots; // lib-relative, posix, no trailing slash
  late final List<String> _barrelOutputs; // lib-relative barrel files
  late final Set<String> _barrelOwnedFiles; // lib-relative files listed in barrels.yaml `files` / `extra_exports`
  List<BarrelImportIssue> run({bool includeNonFeatures = true}) {
    _loadConfig();
    final issues = <BarrelImportIssue>[];
    final libDir = Directory('${root.path}${Platform.pathSeparator}lib');
    if (!libDir.existsSync()) return issues;

    for (final entity in libDir.listSync(recursive: true, followLinks: false)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;
      final libRel = _toLibRelative(entity.path);
      if (libRel == null) continue;
      if (libRel.startsWith('barrels/')) continue;
      if (libRel.startsWith('tooling/')) continue;
      if (libRel.startsWith('builders/')) continue;
      if (libRel.endsWith('.g.dart') ||
          libRel.endsWith('.freezed.dart') ||
          libRel.endsWith('.get_put.dart') ||
          libRel.endsWith('.i69n.dart') ||
          libRel.endsWith('.mocks.dart')) {
        continue;
      }

      final inFeature = libRel.startsWith('features/');
      if (!inFeature && !includeNonFeatures) continue;

      issues.addAll(_lintFile(file: entity, libRel: libRel, inFeature: inFeature));
    }
    return issues;
  }

  void _loadConfig() {
    final pubspec = File('${root.path}${Platform.pathSeparator}pubspec.yaml');
    final pubYaml = loadYaml(pubspec.readAsStringSync()) as YamlMap;
    _packageName = pubYaml['name'] as String;

    final configFile = File('${root.path}${Platform.pathSeparator}config${Platform.pathSeparator}barrels.yaml');
    final yaml = loadYaml(configFile.readAsStringSync()) as YamlMap;
    final barrels = yaml['barrels'] as YamlList? ?? YamlList();

    final roots = <String>{};
    final outputs = <String>{};
    final owned = <String>{};
    for (final raw in barrels) {
      final barrel = raw as YamlMap;
      final output = _normalizeRel(barrel['output'] as String);
      outputs.add(output.startsWith('lib/') ? output.substring(4) : output);
      for (final r in _stringList(barrel['roots'])) {
        roots.add(_normalizeRel(r).replaceFirst(RegExp(r'^lib/'), ''));
      }
      for (final f in [..._stringList(barrel['files']), ..._stringList(barrel['extra_exports'])]) {
        owned.add(_normalizeRel(f).replaceFirst(RegExp(r'^lib/'), ''));
      }
    }
    _barreledRoots = roots.toList()..sort((a, b) => b.length.compareTo(a.length));
    _barrelOutputs = outputs.toList();
    _barrelOwnedFiles = owned;
  }

  List<BarrelImportIssue> _lintFile({
    required File file,
    required String libRel,
    required bool inFeature,
  }) {
    final lines = file.readAsLinesSync();
    if (lines.any(_isIgnoreForFile)) return const [];

    final issues = <BarrelImportIssue>[];
    final featureName = inFeature ? _featureName(libRel) : null;
    final sourceRoot = _rootFor(libRel);
    // Inside a barreled root / listed barrel file, packages may be imported (dependency ownership).
    final allowDirectPackages = sourceRoot != null || _barrelOwnedFiles.contains(libRel);

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      final match = RegExp(r'''^import\s+['"]([^'"]+)['"]''').firstMatch(line);
      if (match == null) continue;

      final uri = match.group(1)!;
      if (_isIgnoredLine(lines, i)) continue;

      if (uri.startsWith('dart:')) continue;

      if (uri.startsWith('package:')) {
        final prefix = 'package:$_packageName/';
        if (uri.startsWith(prefix)) {
          final resolved = _normalizeRel(uri.substring(prefix.length));
          if (_isBarrelImport(resolved)) continue;
          issues.addAll(
            _issueForResolved(
              libRel: libRel,
              lineNumber: i + 1,
              uri: uri,
              resolved: resolved,
              inFeature: inFeature,
              featureName: featureName,
              sourceRoot: sourceRoot,
            ),
          );
          continue;
        }

        // Third-party / Flutter SDK package import
        if (allowDirectPackages) continue;
        issues.add(
          BarrelImportIssue(
            filePath: libRel,
            lineNumber: i + 1,
            importUri: uri,
            resolvedLibPath: uri,
            message: 'Do not import packages directly. Re-export via a barrel '
                '(`package_exports` in config/barrels.yaml) and import that barrel.',
          ),
        );
        continue;
      }

      // Relative import
      final resolved = _resolveRelative(fromLibRel: libRel, uri: uri);
      if (resolved == null) continue;

      if (_isBarrelImport(resolved)) continue;

      issues.addAll(
        _issueForResolved(
          libRel: libRel,
          lineNumber: i + 1,
          uri: uri,
          resolved: resolved,
          inFeature: inFeature,
          featureName: featureName,
          sourceRoot: sourceRoot,
        ),
      );
    }
    return issues;
  }

  List<BarrelImportIssue> _issueForResolved({
    required String libRel,
    required int lineNumber,
    required String uri,
    required String resolved,
    required bool inFeature,
    required String? featureName,
    required String? sourceRoot,
  }) {
    if (inFeature && featureName != null) {
      if (resolved.startsWith('features/$featureName/')) return const [];
      return [
        BarrelImportIssue(
          filePath: libRel,
          lineNumber: lineNumber,
          importUri: uri,
          resolvedLibPath: resolved,
          message: resolved.startsWith('features/')
              ? 'Cross-feature import is not allowed (features have no barrel). '
                  'Use `// ignore: $ruleId` on the line above, or route via DI/callbacks.'
              : 'Import shared code via `lib/barrels/*_barrel.dart`, not `$resolved`.',
        ),
      ];
    }

    final targetRoot = _rootFor(resolved);
    if (targetRoot == null) {
      // e.g. features from core/page_details — allowed (no features barrel)
      return const [];
    }
    if (sourceRoot == targetRoot) return const [];

    return [
      BarrelImportIssue(
        filePath: libRel,
        lineNumber: lineNumber,
        importUri: uri,
        resolvedLibPath: resolved,
        message: 'Import `$targetRoot` via its barrel, not `$resolved`.',
      ),
    ];
  }

  bool _isBarrelImport(String libRelPath) {
    if (!libRelPath.startsWith('barrels/')) return false;
    return libRelPath.endsWith('_barrel.dart') || _barrelOutputs.contains(libRelPath);
  }

  String? _rootFor(String libRelPath) {
    for (final root in _barreledRoots) {
      if (libRelPath == root || libRelPath.startsWith('$root/')) return root;
    }
    return null;
  }

  String? _featureName(String libRelPath) {
    final parts = libRelPath.split('/');
    if (parts.length < 2 || parts[0] != 'features') return null;
    return parts[1];
  }

  String? _resolveRelative({required String fromLibRel, required String uri}) {
    final fromDir = fromLibRel.contains('/') ? fromLibRel.substring(0, fromLibRel.lastIndexOf('/')) : '';
    final joined = _normalizeRel(fromDir.isEmpty ? uri : '$fromDir/$uri');
    if (joined.startsWith('../') || joined == '..') return null;
    return joined;
  }

  bool _isIgnoreForFile(String line) {
    final t = line.trim();
    if (!t.startsWith('//')) return false;
    return RegExp(
      r'//\s*ignore_for_file\s*:\s*([^/\n]+)',
    ).firstMatch(t)?.group(1)?.split(',').any((p) => p.trim() == ruleId) ??
        false;
  }

  bool _isIgnoredLine(List<String> lines, int index) {
    if (index == 0) return false;
    final prev = lines[index - 1].trim();
    if (!prev.startsWith('//')) return false;
    final m = RegExp(r'//\s*ignore\s*:\s*([^/\n]+)').firstMatch(prev);
    if (m == null) return false;
    return m.group(1)!.split(',').any((p) => p.trim() == ruleId);
  }

  String? _toLibRelative(String absolutePath) {
    final idx = absolutePath.replaceAll('\\', '/').lastIndexOf('/lib/');
    if (idx < 0) return null;
    return _normalizeRel(absolutePath.replaceAll('\\', '/').substring(idx + '/lib/'.length));
  }

  static String _normalizeRel(String path) {
    final parts = <String>[];
    for (final part in path.replaceAll('\\', '/').split('/')) {
      if (part.isEmpty || part == '.') continue;
      if (part == '..') {
        if (parts.isNotEmpty) {
          parts.removeLast();
        } else {
          parts.add('..');
        }
        continue;
      }
      parts.add(part);
    }
    return parts.join('/');
  }

  static List<String> _stringList(dynamic value) {
    if (value is! YamlList) return const [];
    return value.map((e) => e.toString()).toList();
  }

  static Directory _findProjectRoot() {
    var dir = Directory.current;
    while (true) {
      if (File('${dir.path}${Platform.pathSeparator}pubspec.yaml').existsSync()) {
        return dir;
      }
      final parent = dir.parent;
      if (parent.path == dir.path) {
        throw StateError('Could not find pubspec.yaml from ${Directory.current.path}');
      }
      dir = parent;
    }
  }
}

class BarrelImportIssue {
  const BarrelImportIssue({
    required this.filePath,
    required this.lineNumber,
    required this.importUri,
    required this.resolvedLibPath,
    required this.message,
  });

  final String filePath;
  final int lineNumber;
  final String importUri;
  final String resolvedLibPath;
  final String message;

  @override
  String toString() =>
      'warning • lib/$filePath:$lineNumber:${BarrelImportLinter.ruleId} • $message\n'
      '    import \'$importUri\';';
}
