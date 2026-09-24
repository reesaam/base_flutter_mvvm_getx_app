import 'dart:async';

import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/services_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';
// ignore: barrel_import_lints/only_barrel_imports
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

  void _fillData() {
    darkMode.value = appSettings.value.darkMode;
    selectedLanguage.value = appSettings.value.language;
    LoggerService.to.info(message: 'Fill Setting Data Function Applied Data');
    appSettingDataListener = appSettings.listen((data) {
      darkMode.value = data.darkMode;
      selectedLanguage.value = data.language;
    });
  }

  void functionLanguageModal() => AppBottomSheet().withCancel(
    title: Texts.to.settings.languageModalSelectLanguage,
    form: SettingsLanguageWidget(function: functionLanguageSelectionOnTap),
    dismissible: true,
  );

  void functionLanguageSelectionOnTap(int index) {
    selectedLanguage.value = AppLocalizations.to.supportedLocales[index].getLanguage;
    appSettings.value = appSettings.value.copyWith(language: selectedLanguage.value);
    appSettings.changeLanguage(selectedLanguage.value);
    saveSettings();
    popPage();
    Get.updateLocale(selectedLanguage.value.locale);
    LoggerService.to.debug(message: 'Language Changed to ${selectedLanguage.value.languageName}');
    appReload(bootPage: pageDetail);
  }

  void functionDarkModeOnChange(bool value) {
    darkMode.value = value;
    appSettings.value = appSettings.value.copyWith(darkMode: value);
    saveSettings();
    LoggerService.to.info(message: 'DarkMode Changed to ${darkMode.value}');
    AppThemeFunctions.to.changeThemeMode(darkMode.value);
    update();
  }

  void functionCheckUpdateAvailableVersion() async {
    updateAvailableVersion.value = await VersionsController.to.checkUpdateAvailableVersion();
    LoggerService.to.info(message: 'Checked Update Version: ${updateAvailableVersion.value?.version ?? Texts.to.general.notAvailable}');
  }

  void functionGoToUpdatePage() => goToPage(AppPages.update);

  void functionBackup() {
    function() async {
      popPage();
      await AppFileFunctions.to.exportAppData();
    }

    AppAlertDialogs.withOkCancel(
      title: Texts.to.general.warning,
      text: Texts.to.dialogs.data.areYouSureDataExport,
      onTapOk: function,
      dismissible: true,
    );
  }

  void functionRestore() {
    function() async {
      popPage();
      await AppFileFunctions.to.importAppData();
    }

    AppAlertDialogs.withOkCancel(
      title: Texts.to.general.warning,
      text: Texts.to.dialogs.data.areYouSureDataMayLost,
      onTapOk: function,
      dismissible: true,
    );
  }

  void clearAllData() {
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
      dismissible: true,
    );
  }

  void resetAllSettings() {
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
      dismissible: true,
    );
  }

  void saveSettings() => saveAppData(appSettingData: appSettings.value);
}
