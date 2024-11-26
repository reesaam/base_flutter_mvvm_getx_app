import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/app_localization.dart';
import '../../../core/core_elements/core_view.dart';
import '../../../core/core_info/app_info.dart';
import '../../../ui_kit/buttons/app_general_button.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../../../ui_kit/resources/spaces.dart';
import '../controller/update_controller.dart';

@GetPut.page()
class UpdatePage extends CoreView<UpdateController> {
  const UpdatePage({super.key});

  @override
  Widget? get footer => _widgetButtons();

  @override
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _widgetVersions(),
      ]);

  Widget _widgetVersions() => Card(
      child: Container(
          padding: AppPaddings.updateVersions,
          child: Column(children: [
            _widgetVersion(Texts.to.updateCurrentVersion, AppInfo.currentVersion.version),
            AppSpaces.h10,
            Obx(() => _widgetVersion(
                  Texts.to.updateAvailableVersion,
                  controller.updateAvailability() ? controller.availableVersion.value : Texts.to.notAvailable,
                )),
          ])));

  Widget _widgetVersion(String title, String version) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(version)],
      );

  Widget _widgetButtons() => Obx(() => Container(
      padding: AppPaddings.updateButtons,
      child: Column(children: [
        AppGeneralButton(
          text: Texts.to.updateCheckUpdate,
          loading: controller.buttonCheckUpdateLoading.value,
          onTap: controller.checkUpdateFunction,
        ),
        AppGeneralButton(
          text: Texts.to.updateDownloadUpdate,
          loading: controller.buttonDownloadUpdateLoading.value,
          onTap: controller.downloadUpdate,
          disabled: controller.updateAvailability(),
        ),
      ])));
}
