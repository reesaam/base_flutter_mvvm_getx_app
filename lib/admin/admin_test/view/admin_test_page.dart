import 'package:flutter/material.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/app_localization.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/core_elements/core_view.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../ui_kit/buttons/app_general_button.dart';
import '../../../ui_kit/general_widgets/dividers.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../../admin_general_functions.dart';
import '../controller/admin_test_controller.dart';

@GetPut.page()
class AdminTestPage extends CoreView<AdminTestController> {
  const AdminTestPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppDividers.generalWithDisabledColor,
        _appPages(),
        _themes(),
        _checkConnection(),
        _files(),
        _permissions(),
        _notifications(),
        _appData(),
        _share(),

        ///Always Exist at Last
        _tempTest()
      ]);

  _appPages() => AdminFunctions.sectionGrid(
      items: List.generate(
          AppPageDetails.listPages.length,
          (index) => AppGeneralButton(
                text: AppPageDetails.listPages[index].pageName ?? 'Unknown',
                onTap: () => goToPage(AppPageDetails.listPages[index]),
              )),
      title: 'App All Pages');

  _themes() => AdminFunctions.sectionGrid(items: [
        AdminFunctions.itemButton(text: 'Change Dark Mode', function: controller.changeDarkMode),
      ], title: 'Themes');

  _checkConnection() => AdminFunctions.sectionGrid(items: [
        AdminFunctions.itemButton(text: 'Connection Status', function: controller.internetConnection),
        AdminFunctions.itemButton(text: 'Internet Connection', function: controller.internetStatus),
        AdminFunctions.itemButton(text: 'Internet Status', function: controller.checkConnection),
      ], title: 'Connections');

  _files() => AdminFunctions.sectionGrid(items: [
        AdminFunctions.itemButton(text: 'Pick File', function: controller.pickFile),
        AdminFunctions.itemButton(text: 'Save File', function: controller.saveFile),
      ], title: 'Files');

  _permissions() => AdminFunctions.section([
        AdminFunctions.itemButton(text: 'Check All Permissions', function: controller.checkAllPermissions),
        AdminFunctions.itemButton(text: 'Ask All Permissions', function: controller.askAllPermissions),
      ], title: 'Permissions');

  _notifications() => Column(children: [
        AdminFunctions.sectionGrid(items: [
          AdminFunctions.itemButton(text: 'Local Notification', function: controller.showLocalNotification),
          AdminFunctions.itemButton(text: 'Push Notification', function: controller.showPushNotification),
        ], title: 'Notifications'),
      ]);

  _appData() => Column(children: [
        AdminFunctions.sectionGrid(items: [
          AdminFunctions.itemButton(text: 'Load AppData', function: controller.loadAppDataTest),
          AdminFunctions.itemButton(text: 'Import AppData', function: controller.importAppDataTest),
          AdminFunctions.itemButton(text: 'Export AppData', function: controller.exportAppDataTest),
        ], title: 'AppData - Save and Load'),
      ]);

  _share() => Column(children: [
        AdminFunctions.sectionGrid(items: [
          AdminFunctions.itemButton(text: 'Share Text', function: controller.shareText),
          AdminFunctions.itemButton(text: 'Share Url', function: controller.shareUri),
          AdminFunctions.itemButton(text: 'Share File', function: controller.shareFile),
        ], title: 'AppData - Save and Load'),
      ]);

  _tempTest() => Column(children: [
        AdminFunctions.sectionGrid(items: [
          AdminFunctions.itemButton(text: 'Temp Test One', function: controller.tempTestFunctionOne),
          AdminFunctions.itemButton(text: 'Temp Test Two', function: controller.tempTestFunctionTwo),
        ], title: 'Temp Test'),
      ]);
}
