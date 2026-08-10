import '../../barrels/ui_kit_barrel.dart';

class AppPopupMenu extends BaseWidget {
  const AppPopupMenu({super.key, required this.listItems, this.icon, this.text, this.primaryColorIcon});

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
              ? AppIcons.threeDots.widget.withPrimaryColor
              : AppIcons.threeDots.widget.withSecondaryColor
        : primaryColorIcon == true
        ? icon!.withPrimaryColor
        : icon!.withSecondaryColor,
    child: text == null ? null : Text(text!),
    itemBuilder: (context) => List<AppPopupMenuItem>.generate(
      listItems.length,
      (index) => AppPopupMenuItem(text: listItems[index].text, onTapFunction: () => listItems[index].onTap()),
    ),
  );
}
