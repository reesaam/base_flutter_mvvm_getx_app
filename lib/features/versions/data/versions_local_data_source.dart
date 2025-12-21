import '../../../components/storage/app_storage_module.dart';
import '../../../core/core_elements/core_repository.dart';
import '../../../core/core_resources/defined_types.dart';
import '../../../shared/shared_models/core_models/app_version/app_version.dart';

abstract class VersionsLocalDataSource {
  static VersionsLocalDataSource get to => Get.find();

  Future<BaseLocalResponse<AppVersionsList?>> getVersions();
}

@GetPut.repository(as: VersionsLocalDataSource)
class VersionsLocalDataSourceImpl extends CoreRepository implements VersionsLocalDataSource {

  @override
  Future<BaseLocalResponse<AppVersionsList?>> getVersions() async {
    var result = await AppStorage.to.loadAppData();
    return result.map((r) => r?.appVersions);
  }
}
