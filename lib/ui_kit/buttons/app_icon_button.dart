import 'package:flutter/material.dart';

import '../../core/extensions/extensions_on_data_types/extension_icon.dart';
import '../../core/extensions/extensions_on_material_widgets/extension_on_text.dart';
import '../core_widgets.dart';
import '../resources/paddings.dart';
import '../resources/sizes.dart';

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
              ? shrinkSizedBox
              : primaryColor == true
                  ? Text(text!).withPrimaryColor
                  : Text(text!),
        ]));
  }
}
