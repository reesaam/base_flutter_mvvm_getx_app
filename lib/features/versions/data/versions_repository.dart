import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/services_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

abstract class VersionsRepository extends CoreRepository {
  static VersionsRepository get to => Get.find();

  Future<BaseResponse<AppVersionsList?>> getVersions();
}

@GetPut.repository(as: VersionsRepository)
class VersionsRepositoryImpl extends CoreRepositoryImpl implements VersionsRepository {
  @override
  Future<BaseResponse<AppVersionsList?>> getVersions() async {
    // await DioCore.to.callMethod<AppVersionsList>(method: APIMethods.get, url: AppAPIUrls.apiGetVersions);
    var result = await AppStorageService.to.loadAppData();
    return result.map((r) => r?.appVersions);
  }
}
