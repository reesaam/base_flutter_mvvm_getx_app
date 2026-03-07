import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

abstract class VersionsRemoteDataSource extends CoreRepository {
  static VersionsRemoteDataSource get to => Get.find();

  Future<BaseAPIResponse<AppVersionsList>> getVersions();
}

@GetPut.repository(as: VersionsRemoteDataSource)
class VersionsRemoteDataSourceImpl extends CoreRepository implements VersionsRemoteDataSource {
  @override
  Future<BaseAPIResponse<AppVersionsList>> getVersions() async =>
      await DioCore.to.callMethod<AppVersionsList>(method: APIMethods.get, url: AppAPIUrls.apiGetVersions);
}
