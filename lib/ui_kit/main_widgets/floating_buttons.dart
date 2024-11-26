import 'package:flutter/material.dart';

import '../../core/extensions/extensions_on_data_types/extension_icon.dart';


class AppFloatingActionButtons extends FloatingActionButton {
  const AppFloatingActionButtons({super.key, required this.icon, required super.onPressed});

  final Icon icon;

  @override
  Widget? get child => icon.withAppAppBackgroundColor;

  @override
  Widget build(BuildContext context) => FloatingActionButton(mini: true, onPressed: onPressed, child: child);
}
