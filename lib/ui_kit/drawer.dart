import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/shared_models_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class AppDrawer extends Drawer {
  const AppDrawer({super.key});

  @override
  double? get width => Get.width / 1.6;

  @override
  Widget? get child => SafeArea(
          child: Column(children: [
        header(),
        AppDividers.general(),
        AppBox.expanded(child: body()),
        AppDividers.general(),
        footer(),
      ]));

  Widget header() => Container(
      padding: AppPaddings.drawerHeader,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Image.asset(AppLogos.appLogo, width: AppSizes.drawerHeaderIconWidth),
        AppSpaces.w50,
        const Text(AppInfo.appNameInitials, overflow: TextOverflow.ellipsis),
      ]));

  Widget body() {
    List<AppPageDetail> drawerList = AppPages.listPages.where((element) => element.drawerPresence == true).toList();
    return Column(children: List.generate(drawerList.length, (index) => _bodyItem(drawerList[index])));
  }

  Widget _bodyItem(AppPageDetail page) =>
      ListTile(title: Text(page.pageName ?? Texts.to.general.empty), leading: page.iconCode.toIcon(), onTap: () => {popPage(), goToPage(page)});

  Widget footer() => Container(
      padding: AppPaddings.drawerFooter,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        AppIcons.version.widget,
        AppSpaces.w20,
        InkWell(onTap: () => goToPage(AppPages.update), child: Text('${Texts.to.general.version}: ${AppInfo.currentVersion.version}')),
      ]));
}
