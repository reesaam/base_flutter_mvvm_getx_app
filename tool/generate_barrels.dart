// ignore_for_file: avoid_print

import 'dart:io';

import 'package:base_flutter_mvvm_getx_app/tooling/barrels_generator.dart';

/// Generates barrel export files from [config/barrels.yaml].
///
/// ```bash
/// dart run tool/generate_barrels.dart
/// dart run tool/generate_barrels.dart --check
/// ```
Future<void> main(List<String> args) async {
  final checkOnly = args.contains('--check');
  try {
    final generator = BarrelsGenerator();
    if (checkOnly) {
      generator.generate(checkOnly: true);
      print('All barrels up to date.');
      return;
    }
    final changed = generator.generate();
    print('Barrel generation done. Updated: $changed');
  } catch (e, st) {
    stderr.writeln(e);
    stderr.writeln(st);
    exitCode = 1;
  }
}
