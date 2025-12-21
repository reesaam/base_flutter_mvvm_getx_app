import '../../../components/network/dio_core.dart';
import '../../../core/core_elements/core_repository.dart';
import '../../../core/core_resources/apis.dart';
import '../../../core/core_resources/defined_types.dart';
import '../../../shared/shared_models/core_models/app_version/app_version.dart';

abstract class VersionsRemoteDataSource {
  static VersionsRemoteDataSource get to => Get.find();

  Future<BaseAPIResponse<AppVersionsList>> getVersions();
}

@GetPut.repository(as: VersionsRemoteDataSource)
class VersionsRemoteDataSourceImpl extends CoreRepository implements VersionsRemoteDataSource {
  @override
  Future<BaseAPIResponse<AppVersionsList>> getVersions() async =>
      await DioCore.to.callMethod<AppVersionsList>(method: APIMethods.get, url: AppAPIUrls.apiGetVersions);
}
