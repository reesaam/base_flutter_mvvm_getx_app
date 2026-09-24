import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';

/// UI label for [AppDevices]; copy lives in `devices` in the localization yaml.
extension OnAppDevices on AppDevices {
  String get localizedTitle => Texts.to.devices[name] as String;
}