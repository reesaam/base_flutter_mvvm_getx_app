import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../data/versions_local_data_source.dart';
import '../data/versions_remote_data_source.dart';

@GetPut.controller()
class VersionsController extends CoreController {

  static VersionsController get to => Get.find();

  Future<AppVersion?> getLastVersion() async {
    AppVersionsList? response = await getVersionsList();
    return response?.versionsList.isEmpty ?? false ? null : response?.versionsList.last;
  }

  Future<AppVersion?> checkUpdateAvailableVersion() async {
    AppVersion? response = await getLastVersion();
    return (response?.version != AppInfo.currentVersion.version) ? response : null;
  }

  Future<AppVersionsList?> getVersionsList() async {
    bool internetAvailability = await AppConnectionChecker.to.checkInternet();
    AppVersionsList? versionsList;
    if (internetAvailability) {
      var response = await VersionsRemoteDataSource.to.getVersions();
      versionsList = response.fold((l) => null, (r) => r);
    }
    if (versionsList == null) {
      var response = await VersionsLocalDataSource.to.getVersions();
      versionsList = response.fold((l) => null, (r) => r);
    }
    return versionsList;
  }
}
