import '../ui_kit_barrel.dart';
export '../ui_kit_barrel.dart';

import '../../core/extensions/material_widgets_extensions/extension_text.dart';

class AppIconButton extends MaterialButton {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.primaryColor,
    this.text,
    this.size,
  }) : super(onPressed: onTap);

  final Icon icon;
  final Function() onTap;
  final bool? primaryColor;
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
            icon: primaryColor == true ? icon.withPrimaryColor : icon.withSecondaryColor,
          ),
          text == null
              ? AppBox.shrink()
              : primaryColor == true
                  ? Text(text!).withPrimaryColor
                  : Text(text!),
        ]));
  }
}
