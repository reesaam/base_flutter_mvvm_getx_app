import 'package:flutter/material.dart';

import '../../core/extensions/extensions_on_data_types/extension_icon.dart';
import '../resources/elements.dart';
import '../../core/core_resources/icons.dart';
import '../resources/paddings.dart';
import 'popup_menu_item.dart';

class AppPopupMenu extends StatelessWidget {
  const AppPopupMenu({
    super.key,
    required this.listItems,
    this.icon,
    this.text,
    this.primaryColorIcon,
  });

  final List<AppPopupMenuItem> listItems;
  final Icon? icon;
  final String? text;
  final bool? primaryColorIcon;

  @override
  Widget build(BuildContext context) => PopupMenuButton(
      padding: AppPaddings.zero,
      shape: AppElements.borderShapeDefault,
      icon: icon == null
          ? primaryColorIcon == true
              ? AppIcons.threeDots.withPrimaryColor
              : AppIcons.threeDots.withSecondaryColor
          : primaryColorIcon == true
              ? icon!.withPrimaryColor
              : icon!.withSecondaryColor,
      child: text == null ? null : Text(text!),
      itemBuilder: (context) => List<AppPopupMenuItem>.generate(
          listItems.length, (index) => AppPopupMenuItem(text: listItems[index].text, onTapFunction: () => listItems[index].onTap())));
}
