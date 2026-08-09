import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

abstract class VersionsLocalDataSource extends CoreRepository {
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
