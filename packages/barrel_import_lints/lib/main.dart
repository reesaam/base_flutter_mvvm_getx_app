import 'package:analysis_server_plugin/plugin.dart';
import 'package:analysis_server_plugin/registry.dart';

import 'src/only_barrel_imports_rule.dart';

/// Analysis server entry point. Loaded from `analysis_options.yaml` `plugins:`.
final plugin = BarrelImportLintsPlugin();

class BarrelImportLintsPlugin extends Plugin {
  @override
  String get name => 'barrel_import_lints';

  @override
  void register(PluginRegistry registry) {
    registry.registerLintRule(OnlyBarrelImportsRule());
  }
}
