import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_localization.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/core_functions.dart';
import '../../core/core_info/app_info.dart';
import '../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../core/core_resources/icons.dart';
import '../../core/core_resources/logos.dart';
import '../../core/core_resources/page_details.dart';
import '../../core/extensions/extensions_on_data_types/extension_int.dart';
import '../resources/paddings.dart';
import '../resources/sizes.dart';
import '../resources/spaces.dart';
import '../general_widgets/dividers.dart';

class AppDrawer extends Drawer {
  const AppDrawer({super.key});

  @override
  double? get width => Get.width / 1.6;

  @override
  Widget? get child => SafeArea(
          child: Column(children: [
        header(),
        AppDividers.general(),
        Expanded(child: body()),
        AppDividers.general(),
        footer(),
      ]));

  Widget header() => Container(
      padding: AppPaddings.drawerHeader,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Image.asset(AppLogos.appLogo, width: AppSizes.drawerHeaderIconWidth),
        AppSpaces.w50,
        Text(AppInfo.appNameInitials, overflow: TextOverflow.ellipsis),
      ]));

  Widget body() {
    List<AppPageDetail> drawerList = AppPageDetails.listPages.where((element) => element.drawerPresence == true).toList();
    return Column(children: List.generate(drawerList.length, (index) => _bodyItem(drawerList[index])));
  }

  Widget _bodyItem(AppPageDetail page) =>
      ListTile(title: Text(page.pageName ?? Texts.to.empty), leading: page.iconCode.toIcon(), onTap: () => {popPage(), goToPage(page)});

  Widget footer() => Container(
      padding: AppPaddings.drawerFooter,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        AppIcons.version,
        AppSpaces.w20,
        InkWell(onTap: () => goToUpdatePage(), child: Text('${Texts.to.version}: ${AppInfo.currentVersion.version}')),
      ]));
}
