import '../../barrels/core_resources_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class AppIconButton extends MaterialButton {
  const AppIconButton({super.key, required this.icon, required this.onTap, this.iconColor, this.text, this.iconSize, this.backgroundColor})
    : super(onPressed: onTap);

  final AppIcons icon;
  final Function() onTap;
  final AppColors? iconColor;
  final double? iconSize;
  final String? text;
  final AppColors? backgroundColor;

  @override
  VoidCallback? get onPressed => onTap();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color: backgroundColor?.color,
          padding: AppPaddings.zero,
          // iconSize: iconSize ?? AppSizes.iconButtonIconSize,
          icon: icon.widget.copyWith(color: iconColor?.color, size: iconSize ?? AppDefaults.iconButtonSize),
          onPressed: onTap,
        ),
        if (text.isNotNullOrEmpty) Text(text ?? '').withColor(iconColor?.color),
      ],
    );
  }
}
