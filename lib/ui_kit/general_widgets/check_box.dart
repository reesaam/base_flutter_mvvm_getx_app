import '../../barrels/ui_kit_barrel.dart';

class AppCheckBox extends BaseWidget {
  const AppCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget get widget => Checkbox(
      // side: AppElements.defaultBorderSideCheckBox,
      value: value,
      onChanged: (isChecked) => onChanged(isChecked));
}
