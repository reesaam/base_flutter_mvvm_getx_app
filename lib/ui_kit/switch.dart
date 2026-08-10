import '../../barrels/ui_kit_barrel.dart';

class AppSwitch extends BaseWidget {
  const AppSwitch({super.key, required this.value, required this.onChanged, this.enabled});

  final bool? value;
  final Function? onChanged;
  final bool? enabled;

  @override
  Widget get widget => SizedBox(
    height: AppSizes.switchHeight.height,
    child: Switch.adaptive(
      value: value == true ? true : false,
      onChanged: (value) => onChanged!(value),
      focusNode: FocusNode(canRequestFocus: enabled == false ? false : true),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeTrackColor: AppColors.primary.color,
      inactiveTrackColor: AppColors.canvas.color,
      inactiveThumbColor: AppColors.primary.color,
    ),
  );
}
