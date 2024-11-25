import 'package:get/get.dart';

import '../../../shared/shared_models/core_models/app_settings_data/app_setting_data.dart';
import '../../core_functions.dart';
import '../../core_resources/core_enums.dart';

extension ExtensionAppSettingsRxClear on Rx<AppSettingData> {
  Rx<AppSettingData> clearData() {
    final result = value.clearData().obs;
    _saveDataOnStorage(result.value);
    return result;
  }
}

extension ExtensionAppSettingsClear on AppSettingData {
  AppSettingData clearData() {
    var result = const AppSettingData();
    _saveDataOnStorage(result);
    return result;
  }
}

extension ExtensionAppSettingsRxLanguagesEntity on Rx<AppSettingData> {
  changeLanguage(AppLanguages language) => value.changeLanguage(language);
}

extension ExtensionAppSettingsLanguages on AppSettingData {
  changeLanguage(AppLanguages lang) {
    var result = copyWith(language: lang);
    _saveDataOnStorage(result);
    return result;
  }
}

_saveDataOnStorage(AppSettingData data) => saveAppData(appSettingData: data);