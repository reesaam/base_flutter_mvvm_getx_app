import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../../core/core_elements/core_view.dart';
import '../../../core/core_info/app_info.dart';
import '../../../core/core_resources/core_enums.dart';
import '../../../core/core_resources/defaults.dart';
import '../../../ui_kit/general_widgets/dividers.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../../admin_general_functions.dart';
import '../controller/admin_app_resources_controller.dart';

@GetPut.page()
class AdminAppResourcesPage extends CoreView<AdminAppResourcesController> {
  const AdminAppResourcesPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [
        AppDividers.generalWithDisabledColor,
        _appDefaults(),
        _appAPIs(),
        _appTheme(),
        _appColorsLight(),
        _appColorsDark(),
      ]);

  _appDefaults() => AdminFunctions.section([
        AdminFunctions.item(title: 'Font Size', text: AppDefaults.fontSize.toInt().toString()),
        AdminFunctions.item(title: 'Connection Timeout', text: AppDefaults.connectionTimeOut.inSeconds.toString()),
        AdminFunctions.item(title: 'Circular Progress Bar Width', text: AppDefaults.borderWidth.toInt().toString()),
        AdminFunctions.item(
            title: 'SnackBar Animation Duration',
            text: AppDefaults.snackBarAnimationDuration.inSeconds.toInt().toString()),
        AdminFunctions.item(
            title: 'SnackBar Duration', text: AppDefaults.snackBarDuration.inSeconds.toInt().toString()),
        AdminFunctions.item(title: 'Snack Position', text: AppDefaults.snackBarPosition.toString().split('.').last),
        AdminFunctions.item(title: 'Border Width', text: AppDefaults.borderWidth.toInt().toString()),
      ], title: 'App Defaults');

  _appTheme() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(children: [
                      AdminFunctions.item(title: 'Canvas Color', widget: _colorWidget(Get.theme.canvasColor)),
                      AdminFunctions.item(title: 'Primary Color', widget: _colorWidget(Get.theme.primaryColor)),
                      AdminFunctions.item(
                          title: 'Primary Dark Color', widget: _colorWidget(Get.theme.primaryColorDark)),
                    ]))),
            fullWidth: true)
      ], title: 'Theme');

  _appColorsLight() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(children: [
                      AdminFunctions.item(title: 'Background', widget: _colorWidget(Get.theme.canvasColor)),
                      AdminFunctions.item(title: 'Primary', widget: _colorWidget(Get.theme.primaryColor)),
                      AdminFunctions.item(title: 'Secondary', widget: _colorWidget(Get.theme.colorScheme.secondary)),
                      AdminFunctions.item(title: 'Tertiary', widget: _colorWidget(Get.theme.colorScheme.tertiary)),
                      AdminFunctions.item(title: 'Disabled', widget: _colorWidget(Get.theme.disabledColor)),
                      AdminFunctions.item(title: 'Error', widget: _colorWidget(Get.theme.colorScheme.error)),
                    ]))),
            fullWidth: true)
      ], title: 'App Colors - Light');

  _appColorsDark() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(children: [
                      AdminFunctions.item(title: 'Background', widget: _colorWidget(Get.theme.canvasColor)),
                      AdminFunctions.item(title: 'Primary', widget: _colorWidget(Get.theme.primaryColor)),
                      AdminFunctions.item(title: 'Secondary', widget: _colorWidget(Get.theme.colorScheme.secondary)),
                      AdminFunctions.item(title: 'Tertiary', widget: _colorWidget(Get.theme.colorScheme.tertiary)),
                      AdminFunctions.item(title: 'Disabled', widget: _colorWidget(Get.theme.disabledColor)),
                      AdminFunctions.item(title: 'Error', widget: _colorWidget(Get.theme.colorScheme.error)),
                    ]))),
            fullWidth: true)
      ], title: 'App Colors - Dark');

  _appAPIs() => AdminFunctions.section([
        AdminFunctions.item(title: 'Base URL', text: AppInfo.baseUrl),
        AdminFunctions.item(title: 'API Version', text: APIVersions.v1.getValue),
        AdminFunctions.item(title: 'API URL', text: 'https://${AppInfo.baseUrl}/${APIVersions.v1.getValue}'),
      ], title: 'App APIs');

  _colorWidget(Color color) => CircleAvatar(
        minRadius: 20,
        maxRadius: 20,
        backgroundColor: Colors.white,
        child: CircleAvatar(
            minRadius: 20,
            maxRadius: 20,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              minRadius: 18,
              maxRadius: 18,
              backgroundColor: color,
            )),
      );
}
