import '../../../core/core_elements/core_view.dart';
import '../../../ui_kit/general_widgets/image.dart';
import '../../../ui_kit/main_widgets/progress_indicator.dart';
import '../controller/splash_screen_controller.dart';

@GetPut.page(isInitial: true)
class SplashScreenPage extends CoreView<SplashScreenController> {
  const SplashScreenPage({super.key});

  @override
  Widget get body => Container(
      alignment: Alignment.center,
      width: Get.width,
      height: Get.height - 100,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        AppBox.shrinkExpanded(flex: 4),
        AppBox.expanded(flex: 4, child: _widgetLogo()),
        AppBox.expanded(flex: 8, child: _widgetAppName()),
        AppBox.expanded(flex: 6, child: _widgetLoadingIndicator()),
      ]));

  Widget _widgetLogo() => Container(
        alignment: Alignment.center,
        child: AppImage(image: controller.logoSource),
      );

  Widget _widgetAppName() => Container(
        alignment: Alignment.center,
        child: Text(controller.appName, style: Get.theme.textTheme.titleSmall),
      );

  Widget _widgetLoadingIndicator() => Container(
        alignment: Alignment.center,
        child: AppProgressIndicator.circular(width: 50),
      );
}
