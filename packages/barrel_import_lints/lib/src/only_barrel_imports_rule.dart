import 'package:analyzer/analysis_rule/analysis_rule.dart';
import 'package:analyzer/analysis_rule/rule_context.dart';
import 'package:analyzer/analysis_rule/rule_visitor_registry.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:yaml/yaml.dart';

import 'policy.dart';

/// Flags imports that bypass barrels across **all of `lib/`**.
///
/// Severity is [DiagnosticSeverity.ERROR] so the IDE shows a red underline.
///
/// Suppress with:
/// `// ignore: barrel_import_lints/only_barrel_imports`
/// or `// ignore_for_file: barrel_import_lints/only_barrel_imports`
class OnlyBarrelImportsRule extends AnalysisRule {
  OnlyBarrelImportsRule()
    : super(name: BarrelImportPolicy.ruleId, description: 'Import shared layers and packages only via lib/barrels/*_barrel.dart.');

  static const LintCode code = LintCode(
    BarrelImportPolicy.ruleId,
    '{0}',
    correctionMessage:
        'Use a barrel under lib/barrels/, or suppress with '
        '// ignore: ${BarrelImportPolicy.pluginRuleId}',
    severity: DiagnosticSeverity.ERROR,
  );

  @override
  DiagnosticCode get diagnosticCode => code;

  final Map<String, _CachedPolicy> _cache = {};

  @override
  void registerNodeProcessors(RuleVisitorRegistry registry, RuleContext context) {
    final policy = _policyFor(context);
    if (policy == null) return;

    final libRel = _libRelativePath(context.definingUnit.file.path);
    if (libRel == null) return;

    registry.addImportDirective(this, _Visitor(this, policy, libRel));
  }

  BarrelImportPolicy? _policyFor(RuleContext context) {
    final package = context.package;
    if (package == null) return null;

    final optionsRoot = package.root;
    final pubspec = optionsRoot.getChildAssumingFile('pubspec.yaml');
    final barrels = optionsRoot.getChildAssumingFile('config/barrels.yaml');
    if (!pubspec.exists || !barrels.exists) return null;

    final key = '${pubspec.path}|${barrels.path}';
    final stamp = '${pubspec.modificationStamp}:${barrels.modificationStamp}';
    final cached = _cache[key];
    if (cached != null && cached.stamp == stamp) return cached.policy;

    final packageName = _readPackageName(pubspec);
    if (packageName == null) return null;

    final yaml = loadYaml(barrels.readAsStringSync());
    if (yaml is! YamlMap) return null;

    final policy = BarrelImportPolicy.fromYaml(packageName: packageName, barrelsYaml: yaml);
    _cache[key] = _CachedPolicy(stamp, policy);
    return policy;
  }

  static String? _readPackageName(File pubspecFile) {
    final node = loadYaml(pubspecFile.readAsStringSync());
    if (node is! YamlMap) return null;
    final name = node['name'];
    return name is String ? name : null;
  }

  static String? _libRelativePath(String absolutePath) {
    final normalized = absolutePath.replaceAll('\\', '/');
    const marker = '/lib/';
    final idx = normalized.lastIndexOf(marker);
    if (idx < 0) return null;
    return BarrelImportPolicy.normalizeRel(normalized.substring(idx + marker.length));
  }
}

class _CachedPolicy {
  _CachedPolicy(this.stamp, this.policy);
  final String stamp;
  final BarrelImportPolicy policy;
}

class _Visitor extends SimpleAstVisitor<void> {
  _Visitor(this.rule, this.policy, this.libRel);

  final OnlyBarrelImportsRule rule;
  final BarrelImportPolicy policy;
  final String libRel;

  @override
  void visitImportDirective(ImportDirective node) {
    final uri = node.uri.stringValue;
    if (uri == null) return;

    final message = policy.checkImport(libRel: libRel, uri: uri);
    if (message == null) return;

    rule.reportAtNode(node.uri, arguments: [message]);
  }
}
