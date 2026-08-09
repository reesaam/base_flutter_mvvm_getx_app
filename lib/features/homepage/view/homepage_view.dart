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
  Widget? get bottomNavigationBar => const AppBottomNavigationBar();

  @override
  Widget? get bottomSheet => _adminTestButton();

  @override
  Widget get body => Center(
    child: layout.constrainContent(Column(children: [AppSpaces.h50, _logo(layout.height / 6), AppSpaces.h50, _developer(layout.height / 6)])),
  );

  Widget _adminTestButton() => Padding(
    padding: AppPaddings.pages,
    child: AppButton.general(text: 'Admin Test Page', onTap: () => goToPage(AppPages.adminStartPage)),
  );

  Widget _logo(double height) => AppContainer(
    alignment: Alignment.center,
    padding: AppPaddings.homepageTopBar,
    height: height,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBox.expanded(flex: 1, child: const AppImage(image: AppLogos.appLogo)),
        AppBox.expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Base Flutter App').withSizeTitleSmall,
              const Text('MVVM Architecture').withSizeDisplaySmall,
              const Text('GetX State Manager').withSizeDisplaySmall,
              Text('${layout.deviceType.name} · ${layout.width.toInt()}px').withSizeBodySmall,
            ],
          ),
        ),
      ],
    ),
  );

  Widget _developer(double height) => AppContainer(
    alignment: Alignment.center,
    padding: AppPaddings.homepageTopBar,
    height: height,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBox.expanded(flex: 1, child: const AppImage(image: AppLogos.developerLogo)),
        AppBox.expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(AppDeveloperInfo.fullName).withSizeTitleSmall, Text('Software Developer').withSizeDisplaySmall],
          ),
        ),
      ],
    ),
  );
}
