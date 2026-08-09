import 'package:yaml/yaml.dart';

/// Barrel-import policy for **all** of `lib/` (not only features).
///
/// Allowed:
/// - `lib/barrels/*_barrel.dart` (includes `package_exports`)
/// - same-feature relatives (`features/<this>/...`)
/// - same barreled-root relatives
/// - `dart:` SDK imports
/// - `package:` imports **only inside** barreled roots / barrel `files:` (dependency ownership)
///
/// Everything else needs an ignore:
/// ```dart
/// // ignore: barrel_import_lints/only_barrel_imports
/// // ignore_for_file: barrel_import_lints/only_barrel_imports
/// ```
class BarrelImportPolicy {
  BarrelImportPolicy({
    required this.packageName,
    required this.barreledRoots,
    required this.barrelOutputs,
    required this.barrelOwnedFiles,
  });

  factory BarrelImportPolicy.fromYaml({
    required String packageName,
    required YamlMap barrelsYaml,
  }) {
    final barrels = barrelsYaml['barrels'] as YamlList? ?? YamlList();
    final roots = <String>{};
    final outputs = <String>{};
    final owned = <String>{};
    for (final raw in barrels) {
      final barrel = raw as YamlMap;
      final output = normalizeRel(barrel['output'] as String);
      outputs.add(output.startsWith('lib/') ? output.substring(4) : output);
      for (final r in stringList(barrel['roots'])) {
        roots.add(normalizeRel(r).replaceFirst(RegExp(r'^lib/'), ''));
      }
      for (final f in [...stringList(barrel['files']), ...stringList(barrel['extra_exports'])]) {
        owned.add(normalizeRel(f).replaceFirst(RegExp(r'^lib/'), ''));
      }
    }
    return BarrelImportPolicy(
      packageName: packageName,
      barreledRoots: roots.toList()..sort((a, b) => b.length.compareTo(a.length)),
      barrelOutputs: outputs.toList(),
      barrelOwnedFiles: owned,
    );
  }

  static const ruleId = 'only_barrel_imports';
  static const pluginRuleId = 'barrel_import_lints/only_barrel_imports';

  final String packageName;
  final List<String> barreledRoots;
  final List<String> barrelOutputs;
  final Set<String> barrelOwnedFiles;

  /// Returns a violation message, or `null` if the import is allowed.
  String? checkImport({
    required String libRel,
    required String uri,
  }) {
    if (_shouldSkipFile(libRel)) return null;
    if (uri.startsWith('dart:')) return null;

    final sourceFeature = _featureName(libRel);
    final sourceRoot = rootFor(libRel);
    final allowDirectPackages = sourceRoot != null || barrelOwnedFiles.contains(libRel);

    if (uri.startsWith('package:')) {
      final prefix = 'package:$packageName/';
      if (uri.startsWith(prefix)) {
        final resolved = normalizeRel(uri.substring(prefix.length));
        if (isBarrelImport(resolved)) return null;
        return _messageForResolved(
          resolved: resolved,
          sourceFeature: sourceFeature,
          sourceRoot: sourceRoot,
        );
      }
      if (allowDirectPackages) return null;
      return 'Do not import packages directly from `$libRel`. '
          'Re-export via a barrel (`package_exports` in config/barrels.yaml) and import that barrel.';
    }

    final resolved = resolveRelative(fromLibRel: libRel, uri: uri);
    if (resolved == null) return null;
    if (isBarrelImport(resolved)) return null;
    return _messageForResolved(
      resolved: resolved,
      sourceFeature: sourceFeature,
      sourceRoot: sourceRoot,
    );
  }

  String? _messageForResolved({
    required String resolved,
    required String? sourceFeature,
    required String? sourceRoot,
  }) {
    final targetFeature = _featureName(resolved);

    // Same feature: relatives are always OK (features have no barrel).
    if (sourceFeature != null && targetFeature == sourceFeature) return null;

    // Any other features/ path (cross-feature or outside → feature).
    if (targetFeature != null) {
      return 'Feature imports must stay in-feature, or be explicitly ignored '
          '(features have no barrel). Use `// ignore: $pluginRuleId`.';
    }

    final targetRoot = rootFor(resolved);
    if (targetRoot == null) {
      // e.g. lib/main.dart ↔ other loose lib files — require barrels / ignore.
      if (sourceRoot == null && !resolved.startsWith('barrels/')) {
        return 'Import shared code via `lib/barrels/*_barrel.dart`, not `$resolved`.';
      }
      return null;
    }
    if (sourceRoot == targetRoot) return null;
    return 'Import `$targetRoot` via its barrel, not `$resolved`.';
  }

  bool _shouldSkipFile(String libRel) {
    if (libRel.startsWith('barrels/')) return true;
    if (libRel.startsWith('tooling/')) return true;
    if (libRel.startsWith('builders/')) return true;
    if (libRel.endsWith('.g.dart') ||
        libRel.endsWith('.freezed.dart') ||
        libRel.endsWith('.get_put.dart') ||
        libRel.endsWith('.i69n.dart') ||
        libRel.endsWith('.mocks.dart')) {
      return true;
    }
    return false;
  }

  bool isBarrelImport(String libRelPath) {
    if (!libRelPath.startsWith('barrels/')) return false;
    return libRelPath.endsWith('_barrel.dart') || barrelOutputs.contains(libRelPath);
  }

  String? rootFor(String libRelPath) {
    for (final root in barreledRoots) {
      if (libRelPath == root || libRelPath.startsWith('$root/')) return root;
    }
    return null;
  }

  String? _featureName(String libRelPath) {
    final parts = libRelPath.split('/');
    if (parts.length < 2 || parts[0] != 'features') return null;
    return parts[1];
  }

  static String? resolveRelative({required String fromLibRel, required String uri}) {
    final fromDir = fromLibRel.contains('/') ? fromLibRel.substring(0, fromLibRel.lastIndexOf('/')) : '';
    final joined = normalizeRel(fromDir.isEmpty ? uri : '$fromDir/$uri');
    if (joined.startsWith('../') || joined == '..') return null;
    return joined;
  }

  static String normalizeRel(String path) {
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

  static List<String> stringList(dynamic value) {
    if (value is! YamlList) return const [];
    return value.map((e) => e.toString()).toList();
  }
}
