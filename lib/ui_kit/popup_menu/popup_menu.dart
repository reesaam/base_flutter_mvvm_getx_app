import '../../barrels/ui_kit_barrel.dart';

class AppPopupMenu extends BaseWidget {
  const AppPopupMenu({
    super.key,
    required this.listItems,
    this.icon,
    this.text,
    this.background,
    this.outlineColor,
    this.iconColor,
    this.iconSize,
    this.menuPadding,
    this.enabled,
    this.position,
  });

  final List<AppPopupMenuItem> listItems;
  final Icon? icon;
  final String? text;
  final AppColors? background;
  final AppColors? outlineColor;
  final AppColors? iconColor;
  final double? iconSize;
  final AppPaddings? menuPadding;
  final PopupMenuPosition? position;
  final bool? enabled;

  @override
  Widget get widget => PopupMenuButton(
    enabled: enabled ?? true,
    padding: AppPaddings.zero,
    position: position ?? PopupMenuPosition.under,
    shape: AppElements.borderShapeOutline,
    color: background?.color ?? AppColors.background.color,
    iconSize: iconSize,
    menuPadding: menuPadding,
    icon: (icon == null ? AppIcons.threeDots.widget : icon!.withPrimaryColor).withColor(iconColor?.color ?? AppColors.primary.color),
    child: text == null ? null : Text(text!),
    itemBuilder: (context) => List<AppPopupMenuItem>.generate(
      listItems.length,
          (index) => AppPopupMenuItem(text: listItems[index].text, onTapFunction: () => listItems[index].onTap()),
    ),
  );
}
