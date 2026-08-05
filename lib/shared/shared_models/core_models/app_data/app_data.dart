import '../../../../barrels/annotations_barrel.dart';
import '../../../../barrels/core_resources_barrel.dart';
import '../../../../barrels/shared_models_barrel.dart';

part 'app_data.freezed.dart';
part 'app_data.g.dart';

@FreezedCustom.model
abstract class AppData with _$AppData {
  const factory AppData({
    final AppDataVersions? dataVersion,
    final AppVersionsList? appVersions,
    final AppSettingData? settings,
    final AppStatisticsData? statisticsData,
  }) = _AppData;

  factory AppData.fromJson(Map<String, dynamic> json) => _$AppDataFromJson(json);
}
