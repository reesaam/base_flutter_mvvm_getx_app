import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../components/storage/app_storage_module.dart';
import '../../../core/app_localization.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_resources/core_enums.dart';
import '../../../core/core_resources/core_flags.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../core/extensions/extensions_on_data_models/extension_settings.dart';
import '../../../core/extensions/extensions_on_data_types/extension_languages.dart';
import '../../../core/extensions/extensions_on_data_types/extension_locale.dart';
import '../../../shared/shared_models/core_models/app_settings_data/app_setting_data.dart';
import '../../../shared/shared_models/core_models/app_version/app_version.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';
import '../../../ui_kit/dialogs/app_bottom_dialogs.dart';
import '../../../ui_kit/theme/themes.dart';
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
  void dataInit() {
    appSettings.value = loadAppData()?.settings ?? const AppSettingData();
    CoreFlags.checkUpdate ? functionCheckUpdateAvailableVersion() : null;
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.settings;
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

  functionLanguageModal() => AppBottomDialogs().withCancel(
      title: Texts.to.settingsLanguageModalSelectLanguage, form: SettingsLanguageWidget(function: functionLanguageSelectionOnTap), dismissible: true);

  functionLanguageSelectionOnTap(int index) {
    selectedLanguage.value = AppLocalization.languagesList[index].getLanguage;
    appSettings.changeLanguage(selectedLanguage.value);
    saveSettings();
    popPage();
    Get.updateLocale(selectedLanguage.value.getLocale());
    appDebugPrint('Language Changed to ${selectedLanguage.value.languageName}');
    // appReload(bootPage: pageDetail);
  }

  functionDarkModeOnChange(bool value) {
    darkMode.value = value;
    appSettings.value = appSettings.value.copyWith(darkMode: value);
    saveSettings();
    appLogPrint('DarkMode Changed to ${darkMode.value}');
    Get.changeTheme(darkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme);
  }

  functionCheckUpdateAvailableVersion() async {
    updateAvailableVersion.value = await checkAvailableVersion();
    appLogPrint('Checked Update Version: ${updateAvailableVersion.value?.version ?? Texts.to.notAvailable}');
  }

  functionGoToUpdatePage() => goToUpdatePage();

  functionBackup() {
    function() async {
      popPage();
      await AppStorage.to.exportData();
    }

    AppAlertDialogs.withOkCancel(title: Texts.to.warning, text: Texts.to.areYouSureDataExport, onTapOk: function, dismissible: true);
  }

  functionRestore() {
    function() async {
      popPage();
      await AppStorage.to.importData();
    }

    AppAlertDialogs.withOkCancel(title: Texts.to.warning, text: Texts.to.areYouSureDataMayLost, onTapOk: function, dismissible: true);
  }

  clearAllData() {
    function() {
      popPage();
      clearAppData();
      Get.reloadAll();
      refresh();
    }

    AppAlertDialogs.withOkCancel(title: Texts.to.warning, text: Texts.to.areYouSureDataWillLost, onTapOk: function, dismissible: true);
  }

  resetAllSettings() {
    function() {
      popPage();
      const AppSettingData().clearData;
      Get.reloadAll();
      refresh();
    }

    AppAlertDialogs.withOkCancel(title: Texts.to.warning, text: Texts.to.areYouSureDataWillLost, onTapOk: function, dismissible: true);
  }

  saveSettings() => saveAppData(appSettingData: appSettings.value);
}
