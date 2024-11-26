import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_elements/core_view.dart';
import '../../../ui_kit/core_widgets.dart';
import '../../../ui_kit/general_widgets/image.dart';
import '../../../ui_kit/main_widgets/progress_indicator.dart';
import '../../../ui_kit/theme/themes.dart';
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
        Expanded(flex: 4, child: shrinkSizedBox),
        Expanded(flex: 4, child: _widgetLogo()),
        Expanded(flex: 8, child: _widgetAppName()),
        Expanded(flex: 6, child: _widgetLoadingIndicator()),
      ]));

  Widget _widgetLogo() => Container(
        alignment: Alignment.center,
        child: AppImage(image: controller.logoSource),
      );

  Widget _widgetAppName() => Container(
        alignment: Alignment.center,
        child: Text(controller.appName, style: AppThemes.to.textTheme.titleSmall),
      );

  Widget _widgetLoadingIndicator() => Container(
        alignment: Alignment.center,
        child: AppProgressIndicator.circular(width: 50),
      );
}
