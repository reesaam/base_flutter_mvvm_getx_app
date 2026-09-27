import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/services_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

abstract class AppDataRepository {
  static AppDataRepository get to => Get.find();

  Future<BaseResponse<AppData?>> loadAppData();
  Future<BaseResponse<AppData?>> saveAppData(AppData appData);
  Future<BaseResponse<bool?>> clearAppData();
}

@GetPut.repository()
class AppDataRepositoryImpl extends CoreRepositoryImpl implements AppDataRepository {
  @override
  Future<BaseResponse<AppData?>> loadAppData() async => await AppStorageService.to.loadAppData();

  @override
  Future<BaseResponse<AppData?>> saveAppData(AppData appData) async => await AppStorageService.to.saveAppData(appData: appData);

  @override
  Future<BaseResponse<bool?>> clearAppData() async => await AppStorageService.to.clearAppData();
}
