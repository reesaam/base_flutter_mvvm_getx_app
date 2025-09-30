import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) => Checkbox(
      // side: AppElements.defaultBorderSideCheckBox,
      value: value,
      onChanged: (isChecked) => onChanged(isChecked));
}
