import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/app_routing/app_routing.dart';
import '../../../core/core_elements/core_view.dart';
import '../../../core/core_info/app_info.dart';
import '../../../core/core_info/developer_info.dart';
import '../../../core/core_resources/core_flags.dart';
import '../../../core/core_resources/images.dart';
import '../../../core/core_resources/logos.dart';
import '../../../core/extensions/extensions_on_material_widgets/extension_on_text.dart';
import '../../../ui_kit/buttons/app_general_button.dart';
import '../../../ui_kit/general_widgets/image.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/main_widgets/bottom_navigation_bar.dart';
import '../../../ui_kit/main_widgets/drawer.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../../../ui_kit/resources/spaces.dart';
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
        const Expanded(flex: 1, child: AppImage(image: AppLogos.appLogo)),
        Expanded(
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
        const Expanded(flex: 1, child: AppImage(image: AppLogos.developerLogo)),
        Expanded(
            flex: 2,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(AppDeveloperInfo.fullName).withSizeTitleSmall,
              Text('Software Developer').withSizeDisplaySmall,
            ])),
      ]));

  _adminTestButton() => Padding(
        padding: AppPaddings.pages,
        child: const AppGeneralButton(text: 'Admin Test Page', onTap: gotoAdminStartPage),
      );
}
