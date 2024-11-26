import 'package:dartz/dartz.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../components/failures/local_exception.dart';
import '../../../components/storage/app_storage_module.dart';
import '../../../shared/shared_models/core_models/app_version/app_version.dart';

@GetPut.repository()
class VersionsLocalDataSource {
  Future<Either<LocalException, AppVersionsList?>> getVersions() async {
    var result = await AppStorage.to.loadAppData();
    return result.map((r) => r?.appVersions);
  }
}
