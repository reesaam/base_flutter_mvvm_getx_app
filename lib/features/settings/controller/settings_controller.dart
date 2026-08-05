import 'dart:async';

import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';
import '../../../localization/localizations.dart';
import '../../versions/controller/versions_controller.dart';
import '../widgets/settings_languages_widgets.dart';

@GetPut.controller()
class SettingsController extends CoreController {
  Rx<AppSettingData> appSettings = const AppSettingData().obs;

  Rx<bool> darkMode = false.obs;
  Rx<AppLanguages> selectedLanguage = AppLanguages.english.obs;

  Rx<AppVersion?> updateAvailableVersion = AppVersion.createEmpty().obs;

  //Listeners
  late StreamSubscription<AppSettingData> appSettingDataListener;

  @override
  void dataInit() async {
    final loadedAppData = await loadAppData();
    appSettings.value = loadedAppData?.settings ?? const AppSettingData();
    CoreFlags.checkUpdate ? functionCheckUpdateAvailableVersion() : null;
  }

  @override
  void pageInit() {
    pageDetail = AppPages.settings;
  }

  @override
  void onInitFunction() {
    _fillData();
  }

  @override
  void onCloseFunction() {
    saveSettings();
    appSettingDataListener.cancel();
  }

  _fillData() {
    darkMode.value = appSettings.value.darkMode;
    selectedLanguage.value = appSettings.value.language;
    appDebugPrint('Fill Setting Data Function Applied Data');
    appSettingDataListener = appSettings.listen((data) => _fillData());
  }

  functionLanguageModal() => AppBottomSheet().withCancel(
      title: Texts.to.settings.languageModalSelectLanguage,
      form: SettingsLanguageWidget(function: functionLanguageSelectionOnTap),
      dismissible: true);

  functionLanguageSelectionOnTap(int index) {
    selectedLanguage.value = AppLocalizations.to.supportedLocales[index].getLanguage;
    appSettings.value = appSettings.value.copyWith(language: selectedLanguage.value);
    appSettings.changeLanguage(selectedLanguage.value);
    saveSettings();
    popPage();
    Get.updateLocale(selectedLanguage.value.locale);
    appDebugPrint('Language Changed to ${selectedLanguage.value.languageName}');
    appReload(bootPage: pageDetail);
  }

  functionDarkModeOnChange(bool value) {
    darkMode.value = value;
    appSettings.value = appSettings.value.copyWith(darkMode: value);
    saveSettings();
    appLogPrint('DarkMode Changed to ${darkMode.value}');
    AppThemeFunctions.to.changeThemeMode(darkMode.value);
    update();
  }

  functionCheckUpdateAvailableVersion() async {
    updateAvailableVersion.value = await VersionsController.to.checkUpdateAvailableVersion();
    appLogPrint('Checked Update Version: ${updateAvailableVersion.value?.version ?? Texts.to.general.notAvailable}');
  }

  functionGoToUpdatePage() => goToPage(AppPages.update);

  functionBackup() {
    function() async {
      popPage();
      await AppStorage.to.exportData();
    }

    AppAlertDialogs.withOkCancel(
        title: Texts.to.general.warning,
        text: Texts.to.dialogs.data.areYouSureDataExport,
        onTapOk: function,
        dismissible: true);
  }

  functionRestore() {
    function() async {
      popPage();
      await AppStorage.to.importData();
    }

    AppAlertDialogs.withOkCancel(
        title: Texts.to.general.warning,
        text: Texts.to.dialogs.data.areYouSureDataMayLost,
        onTapOk: function,
        dismissible: true);
  }

  clearAllData() {
    function() {
      popPage();
      clearAppData();
      Get.reloadAll();
      refresh();
    }

    AppAlertDialogs.withOkCancel(
        title: Texts.to.general.warning,
        text: Texts.to.dialogs.data.areYouSureDataWillLost,
        onTapOk: function,
        dismissible: true);
  }

  resetAllSettings() {
    function() {
      popPage();
      const AppSettingData().clearData;
      Get.reloadAll();
      refresh();
    }

    AppAlertDialogs.withOkCancel(
        title: Texts.to.general.warning,
        text: Texts.to.dialogs.data.areYouSureDataWillLost,
        onTapOk: function,
        dismissible: true);
  }

  saveSettings() => saveAppData(appSettingData: appSettings.value);
}
