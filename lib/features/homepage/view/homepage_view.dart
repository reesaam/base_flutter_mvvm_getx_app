import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';
import '../controller/homepage_controller.dart';

@GetPut.page()
class HomePage extends CoreView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget? get drawer => const AppDrawer();

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget? get footer => CoreFlags.isRelease ? null : _adminTestButton();

  @override
  Widget? get bottomNavigationBar => const AppBottomNavigationBar();

  @override
  Widget get body => Center(
          child: Column(
        children: [
          AppSpaces.h50,
          _logo(),
          AppSpaces.h50,
          _developer(),
        ],
      ));

  _logo() => Container(
      alignment: Alignment.center,
      padding: AppPaddings.homepageTopBar,
      height: Get.height / 6,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppBox.expanded(flex: 1, child: const AppImage(image: AppLogos.appLogo)),
        AppBox.expanded(
            flex: 2,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Base Flutter App').withSizeTitleSmall,
              const Text('MVVM Architecture').withSizeDisplaySmall,
              const Text('GetX State Manager').withSizeDisplaySmall,
            ])),
      ]));

  _developer() => Container(
      alignment: Alignment.center,
      padding: AppPaddings.homepageTopBar,
      height: Get.height / 6,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppBox.expanded(flex: 1, child: const AppImage(image: AppLogos.developerLogo)),
        AppBox.expanded(
            flex: 2,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(AppDeveloperInfo.fullName).withSizeTitleSmall,
              Text('Software Developer').withSizeDisplaySmall,
            ])),
      ]));

  _adminTestButton() => Padding(
        padding: AppPaddings.pages,
        child: AppGeneralButton(text: 'Admin Test Page', onTap: () => goToPage(AppPages.adminStartPage)),
      );
}
