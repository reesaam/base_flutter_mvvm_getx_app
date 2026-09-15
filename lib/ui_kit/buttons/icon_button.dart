import '../../barrels/ui_kit_barrel.dart';

class AppIconButton extends MaterialButton {
  const AppIconButton({super.key, required this.icon, required this.onTap, this.iconColor, this.text, this.iconSize}) : super(onPressed: onTap);

  final AppIcons icon;
  final Function() onTap;
  final AppColors? iconColor;
  final double? iconSize;
  final String? text;

  @override
  VoidCallback? get onPressed => onTap();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          padding: AppPaddings.zero,
          iconSize: iconSize ?? AppSizes.iconButtonIconSize,
          onPressed: onTap,
          icon: icon.widget.withColor(iconColor?.color),
        ),
        text == null ? AppBox.shrink() : Text(text!).withColor(iconColor?.color),
      ],
    );
  }
}
