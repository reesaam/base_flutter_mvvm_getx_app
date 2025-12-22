export '../../boiler_plates/boiler_plate_ui_kit.dart';

import '../../core/extensions/data_types_extensions/extension_icon.dart';
import 'popup_menu_item.dart';

class AppPopupMenu extends AppWidget {
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
  Widget get widget => PopupMenuButton(
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
