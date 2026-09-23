import '../../barrels/ui_kit_barrel.dart';

export 'package:flutter/material.dart';
export 'package:flutter/widgets.dart';

abstract class BaseWidget extends StatelessWidget {
  const BaseWidget({super.key});

  Widget get widget;

  @override
  Widget build(BuildContext context) => widget;
}
