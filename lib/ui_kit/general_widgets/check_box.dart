import '../../boiler_plates/boiler_plate_ui_kit.dart';
export '../../boiler_plates/boiler_plate_ui_kit.dart';

class AppCheckBox extends AppWidget {
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
