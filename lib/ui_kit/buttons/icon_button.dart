import '../../barrels/ui_kit_barrel.dart';

class AppIconButton extends MaterialButton {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.text,
    this.size,
  }) : super(onPressed: onTap);

  final AppIcons icon;
  final Function() onTap;
  final AppColors? iconColor;
  final String? text;
  final Size? size;

  @override
  VoidCallback? get onPressed => onTap();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size?.height,
        width: size?.width,
        child: Column(children: [
          IconButton(
            padding: AppPaddings.zero,
            iconSize: AppSizes.iconButtonIconSize,
            onPressed: onTap,
            icon: icon.widget.withColor(iconColor?.color),
          ),
          text == null
              ? AppBox.shrink()
              : Text(text!).withColor(iconColor?.color),
        ]));
  }
}
