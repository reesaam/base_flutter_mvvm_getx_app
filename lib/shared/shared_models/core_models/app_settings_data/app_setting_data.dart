import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/annotations/freezed_custom_annotation.dart';
import '../../../../core/core_resources/core_enums.dart';
import '../../../../core/core_resources/countries.dart';

part 'app_setting_data.freezed.dart';
part 'app_setting_data.g.dart';

@FreezedCustom.model
class AppSettingData with _$AppSettingData {
  const factory AppSettingData({
    @Default(false) bool darkMode,
    @Default(AppLanguages.english) AppLanguages language,
    @Default(AppCountry.us) AppCountry country,
  }) = _AppSettingData;

  factory AppSettingData.fromJson(Map<String, dynamic> json) => _$AppSettingDataFromJson(json);
}

@FreezedCustom.modelList
class AppSettingDataList with _$AppSettingDataList {
  factory AppSettingDataList({@Default(<AppSettingData>[]) List<AppSettingData> appSettingsDataList}) = _AppSettingDataList;

  factory AppSettingDataList.fromJson(Map<String, dynamic> json) => _$AppSettingDataListFromJson(json);
}
