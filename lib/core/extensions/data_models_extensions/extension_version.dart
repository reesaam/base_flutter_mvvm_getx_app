import '../../../barrels/core_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

extension ExtensionAppVersionRxClear on Rx<AppVersionsList> {
  Rx<AppVersionsList> clearData() => value.clearData();
}

extension ExtensionAppVersionClear on AppVersionsList {
  clearData() {
    var result = AppVersionsList();
    _saveDataOnStorage(result);
    return result;
  }
}

_saveDataOnStorage(AppVersionsList data) => saveAppData(appVersionData: data);