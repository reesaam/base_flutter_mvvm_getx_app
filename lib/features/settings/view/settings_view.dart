import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_elements/core_view.dart';
import '../../../core/core_info/app_info.dart';
import '../../../core/extensions/extensions_on_data_types/extension_languages.dart';
import '../../../core/extensions/extensions_on_data_types/extension_locale.dart';
import '../../../core/extensions/extensions_on_data_types/extension_string.dart';
import '../../../localization/localizations.dart';
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
      List.of([AppPopupMenuItem(text: Texts.to.settings.settingsAppbarMenuResetSettings, onTapFunction: () => controller.resetAllSettings())]);

  Widget _widgetGeneral() {
    Widget leadingLanguage() => Text(controller.selectedLanguage.value.getLocale().getLanguageName);

    Widget leadingDarkMode() =>
        AppSwitch(value: controller.darkMode.value, onChanged: (bool value) => controller.functionDarkModeOnChange(value), enabled: false);

    return Obx(() => SettingsSectionWidget(title: Texts.to.settings.settingsSectionTitleGeneral, widgets: [
          SettingsSectionItemWidget(
            text: Texts.to.settings.settingsSectionTitleGeneralLanguage.withDoubleDots,
            leading: leadingLanguage(),
            wholeItemFunction: controller.functionLanguageModal,
          ),
          SettingsSectionItemWidget(
            text: Texts.to.settings.settingsSectionGeneralItemDarkMode.withDoubleDots,
            leading: leadingDarkMode(),
          ),
        ]));
  }

  Widget _widgetUpdate() => Obx(() => SettingsSectionWidget(title: Texts.to.settings.settingsSectionTitleUpdate, widgets: [
        SettingsSectionItemWidget(
          text: Texts.to.settings.settingsSectionTitleUpdateCurrentVersion.withDoubleDots,
          leading: Text(AppInfo.currentVersion.version),
        ),
        SettingsSectionItemWidget(
            text: Texts.to.settings.settingsSectionTitleUpdateAvailableVersion.withDoubleDots,
            leading: Text(controller.updateAvailableVersion.value?.version == AppInfo.currentVersion.version
                ? Texts.to.general.notAvailable
                : controller.updateAvailableVersion.value?.version ?? Texts.to.general.notAvailable),
            wholeItemFunction: controller.functionGoToUpdatePage),
      ]));

  Widget _widgetBackup() => SettingsSectionWidget(title: Texts.to.settings.settingsSectionTitleBackup, widgets: [
        SettingsSectionItemWidget(text: Texts.to.settings.settingsSectionBackupBackup, wholeItemFunction: controller.functionBackup),
        SettingsSectionItemWidget(text: Texts.to.settings.settingsSectionBackupRestore, wholeItemFunction: controller.functionRestore),
      ]);

  Widget _widgetStorage() => SettingsSectionWidget(title: Texts.to.settings.settingsSectionTitleStorage, widgets: [
        SettingsSectionItemWidget(text: Texts.to.settings.settingsSectionStorageItemEraseAllData, wholeItemFunction: controller.clearAllData),
      ]);
}
