import 'dart:async';

import 'package:build/build.dart';

import '../tooling/barrels_generator.dart';

Builder barrelsBuilder(BuilderOptions options) => _BarrelsBuilder();

class _BarrelsBuilder implements Builder {
  @override
  final buildExtensions = const {
    r'$lib$': ['.barrels.stamp'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final changed = BarrelsGenerator().generate();
    await buildStep.writeAsString(buildStep.allowedOutputs.single, 'barrels regenerated; files_updated=$changed\n');
  }
}
