import 'dart:io';

import 'package:base_flutter_mvvm_getx_app/tooling/barrel_import_linter.dart';

/// Lint: shared layers + packages must be imported via barrels; features have no barrel.
///
/// ```bash
/// dart run tool/check_barrel_imports.dart
/// ```
///
/// Override one import:
/// ```dart
/// // ignore: only_barrel_imports
/// import '../../auth/data/auth_session.dart';
/// ```
///
/// Override a whole file:
/// ```dart
/// // ignore_for_file: only_barrel_imports
/// ```
void main(List<String> args) {
  final linter = BarrelImportLinter();
  final issues = linter.run();
  if (issues.isEmpty) {
    stdout.writeln('No barrel-import issues found.');
    exit(0);
  }

  for (final issue in issues) {
    stdout.writeln(issue);
  }
  stdout.writeln('\n${issues.length} issue(s). Rule: ${BarrelImportLinter.ruleId}');
  exit(1);
}
