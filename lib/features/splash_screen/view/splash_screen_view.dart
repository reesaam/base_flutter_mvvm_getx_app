import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

import '../controller/splash_screen_controller.dart';

@GetPut.page(isInitial: true)
class SplashScreenPage extends CoreView<SplashScreenController> {
  const SplashScreenPage({super.key});

  @override
  Widget get body => AppContainer(
      alignment: Alignment.center,
      width: Get.width,
      height: Get.height - 100,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        AppBox.shrinkExpanded(flex: 4),
        AppBox.expanded(flex: 4, child: _widgetLogo()),
        AppBox.expanded(flex: 8, child: _widgetAppName()),
        AppBox.expanded(flex: 6, child: _widgetLoadingIndicator()),
      ]));

  Widget _widgetLogo() => AppContainer(
        alignment: Alignment.center,
        child: AppImage(image: controller.logoSource),
      );

  Widget _widgetAppName() => AppContainer(
        alignment: Alignment.center,
        child: Text(controller.appName, style: Get.theme.textTheme.titleSmall),
      );

  Widget _widgetLoadingIndicator() => AppContainer(
        alignment: Alignment.center,
        child: AppProgressIndicator.circular(width: 50),
      );
}
