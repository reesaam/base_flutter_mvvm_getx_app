import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/annotations/freezed_custom_annotation.dart';
import '../../../../core/core_resources/core_enums.dart';
import '../app_settings_data/app_setting_data.dart';
import '../app_statistics_data/app_statistics_data.dart';
import '../app_version/app_version.dart';

part 'app_data.freezed.dart';
part 'app_data.g.dart';

@FreezedCustom.model
class AppData with _$AppData {
  const factory AppData({
    final AppDataVersions? dataVersion,
    final AppVersionsList? appVersions,
    final AppSettingData? settings,
    final AppStatisticsData? statisticsData,
  }) = _AppData;

  factory AppData.fromJson(Map<String, dynamic> json) => _$AppDataFromJson(json);
}
