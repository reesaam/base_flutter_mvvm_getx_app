import 'package:get/get.dart';

import '../../../shared/shared_models/core_models/app_version/app_version.dart';
import '../../core_functions.dart';

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