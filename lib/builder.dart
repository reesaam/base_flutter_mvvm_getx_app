import 'dart:async';

import 'package:base_flutter_mvvm_getx_app/tooling/barrels_generator.dart';
import 'package:build/build.dart';

/// build_runner entry: regenerates barrels whenever lib sources change.
Builder barrelsBuilder(BuilderOptions options) => _BarrelsBuilder();

class _BarrelsBuilder implements Builder {
  @override
  final buildExtensions = const {
    r'$lib$': ['.barrels.stamp'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final changed = BarrelsGenerator().generate();
    await buildStep.writeAsString(
      buildStep.allowedOutputs.single,
      'barrels regenerated; files_updated=$changed\n',
    );
  }
}
