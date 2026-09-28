import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/services_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

abstract class AppDataRepository extends CoreRepository {
  static AppDataRepository get to => Get.find();

  Future<BaseResponse<AppData?>> loadAppData();

  Future<BaseResponse<AppData?>> saveAppData(AppData appData);

  Future<BaseResponse<AppData?>> saveAppDataItems({
    AppDataVersions? dataVersion,
    AppVersionsList? appVersions,
    AppSettingData? settings,
    AppStatisticsData? statisticsData,
  });

  Future<BaseResponse<bool?>> clearAppData();
}

@GetPut.repository(as: AppDataRepository)
class AppDataRepositoryImpl extends CoreRepositoryImpl implements AppDataRepository {
  @override
  Future<BaseResponse<AppData?>> loadAppData() async => await AppStorageService.to.loadAppData();

  @override
  Future<BaseResponse<AppData?>> saveAppData(AppData appData) async => await AppStorageService.to.saveAppData(appData: appData);

  @override
  Future<BaseResponse<AppData?>> saveAppDataItems({
    AppDataVersions? dataVersion,
    AppVersionsList? appVersions,
    AppSettingData? settings,
    AppStatisticsData? statisticsData,
  }) async {
    var loadResponse = await loadAppData();
    if (loadResponse.isLeft()) return loadResponse.map((r) => null);
    var appData = loadResponse.fold((l) => null, (r) => r);
    var newAppdata = appData?.copyWith(
      dataVersion: dataVersion ?? appData.dataVersion,
      appVersions: appVersions ?? appData.appVersions,
      settings: settings ?? appData.settings,
      statisticsData: statisticsData ?? appData.statisticsData,
    );
    var saveResponse = await saveAppData(newAppdata ?? AppData());
    return saveResponse;
  }

  @override
  Future<BaseResponse<bool?>> clearAppData() async => await AppStorageService.to.clearAppData();
}
