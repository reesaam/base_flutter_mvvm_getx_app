import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/app_localization.dart';
import '../../../core/core_elements/core_view.dart';
import '../../../core/core_info/app_info.dart';
import '../../../core/extensions/extensions_on_data_types/extension_languages.dart';
import '../../../core/extensions/extensions_on_data_types/extension_locale.dart';
import '../../../core/extensions/extensions_on_data_types/extension_string.dart';
import '../../../ui_kit/general_widgets/popup_menu.dart';
import '../../../ui_kit/general_widgets/popup_menu_item.dart';
import '../../../ui_kit/general_widgets/switch.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/main_widgets/bottom_navigation_bar.dart';
import '../../../ui_kit/main_widgets/drawer.dart';
import '../controller/settings_controller.dart';
import '../widgets/settings_sections_widgets.dart';

@GetPut.page()
class SettingsPage extends CoreView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget? get drawer => const AppDrawer();

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget? get bottomNavigationBar => const AppBottomNavigationBar();

  @override
  Widget get body => Column(children: [
        _widgetGeneral(),
        _widgetUpdate(),
        _widgetBackup(),
        _widgetStorage(),
      ]);

  Widget _widgetAppbarThreeDotsButton() => AppPopupMenu(listItems: _listAppbarThreeDotsButton, primaryColorIcon: false);

  List<AppPopupMenuItem> get _listAppbarThreeDotsButton =>
      List.of([AppPopupMenuItem(text: Texts.to.settingsAppbarMenuResetSettings, onTapFunction: () => controller.resetAllSettings())]);

  Widget _widgetGeneral() {
    Widget leadingLanguage() => Text(controller.selectedLanguage.value.getLocale().getLanguageName ?? Texts.to.empty);

    Widget leadingDarkMode() =>
        AppSwitch(value: controller.darkMode.value, onChanged: (bool value) => controller.functionDarkModeOnChange(value), enabled: false);

    return Obx(() => SettingsSectionWidget(title: Texts.to.settingsSectionTitleGeneral, widgets: [
          SettingsSectionItemWidget(
            text: Texts.to.settingsSectionTitleGeneralLanguage.withDoubleDots,
            leading: leadingLanguage(),
            wholeItemFunction: controller.functionLanguageModal,
          ),
          SettingsSectionItemWidget(
            text: Texts.to.settingsSectionGeneralItemDarkMode.withDoubleDots,
            leading: leadingDarkMode(),
          ),
        ]));
  }

  Widget _widgetUpdate() => Obx(() => SettingsSectionWidget(title: Texts.to.settingsSectionTitleUpdate, widgets: [
        SettingsSectionItemWidget(
          text: Texts.to.settingsSectionTitleUpdateCurrentVersion.withDoubleDots,
          leading: Text(AppInfo.currentVersion.version),
        ),
        SettingsSectionItemWidget(
            text: Texts.to.settingsSectionTitleUpdateAvailableVersion.withDoubleDots,
            leading: Text(controller.updateAvailableVersion.value?.version == AppInfo.currentVersion.version
                ? Texts.to.notAvailable
                : controller.updateAvailableVersion.value?.version ?? Texts.to.notAvailable),
            wholeItemFunction: controller.functionGoToUpdatePage),
      ]));

  Widget _widgetBackup() => SettingsSectionWidget(title: Texts.to.settingsSectionTitleBackup, widgets: [
        SettingsSectionItemWidget(text: Texts.to.settingsSectionBackupBackup, wholeItemFunction: controller.functionBackup),
        SettingsSectionItemWidget(text: Texts.to.settingsSectionBackupRestore, wholeItemFunction: controller.functionRestore),
      ]);

  Widget _widgetStorage() => SettingsSectionWidget(title: Texts.to.settingsSectionTitleStorage, widgets: [
        SettingsSectionItemWidget(text: Texts.to.settingsSectionStorageItemEraseAllData, wholeItemFunction: controller.clearAllData),
      ]);
}
