import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/localization_barrel.dart';

import '../../../barrels/ui_kit_barrel.dart';
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

  List<AppPopupMenuItem> get _listAppbarThreeDotsButton => List.of([
        AppPopupMenuItem(
          text: Texts.to.settings.appbarMenuResetSettings,
          onTapFunction: () => controller.resetAllSettings(),
        )
      ]);

  Widget _widgetGeneral() {
    Widget leadingLanguage() => Text(controller.selectedLanguage.value.localLanguageName);

    Widget leadingDarkMode() => AppSwitch(
        value: controller.darkMode.value,
        onChanged: (bool value) => controller.functionDarkModeOnChange(value),
        enabled: false);

    return Obx(() => SettingsSectionWidget(title: Texts.to.settings.sectionTitleGeneral, widgets: [
          SettingsSectionItemWidget(
            text: Texts.to.settings.sectionTitleGeneralLanguage.withDoubleDots,
            leading: leadingLanguage(),
            wholeItemFunction: controller.functionLanguageModal,
          ),
          SettingsSectionItemWidget(
            text: Texts.to.settings.sectionGeneralItemDarkMode.withDoubleDots,
            leading: leadingDarkMode(),
          ),
        ]));
  }

  Widget _widgetUpdate() => Obx(() => SettingsSectionWidget(title: Texts.to.settings.sectionTitleUpdate, widgets: [
        SettingsSectionItemWidget(
          text: Texts.to.settings.sectionTitleUpdateCurrentVersion.withDoubleDots,
          leading: Text(AppInfo.currentVersion.version),
        ),
        SettingsSectionItemWidget(
            text: Texts.to.settings.sectionTitleUpdateAvailableVersion.withDoubleDots,
            leading: Text(controller.updateAvailableVersion.value?.version == AppInfo.currentVersion.version
                ? Texts.to.general.notAvailable
                : controller.updateAvailableVersion.value?.version ?? Texts.to.general.notAvailable),
            wholeItemFunction: controller.functionGoToUpdatePage),
      ]));

  Widget _widgetBackup() => SettingsSectionWidget(title: Texts.to.settings.sectionTitleBackup, widgets: [
        SettingsSectionItemWidget(
            text: Texts.to.settings.sectionBackupBackup, wholeItemFunction: controller.functionBackup),
        SettingsSectionItemWidget(
            text: Texts.to.settings.sectionBackupRestore, wholeItemFunction: controller.functionRestore),
      ]);

  Widget _widgetStorage() => SettingsSectionWidget(title: Texts.to.settings.sectionTitleStorage, widgets: [
        SettingsSectionItemWidget(
            text: Texts.to.settings.sectionStorageItemEraseAllData, wholeItemFunction: controller.clearAllData),
        SettingsSectionItemWidget(text: 'Sign Out', wholeItemFunction: controller.logout),
      ]);
}
