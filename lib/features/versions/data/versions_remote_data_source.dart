import 'package:dartz/dartz.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../components/failures/network_exception.dart';
import '../../../components/network/dio_functions.dart';
import '../../../core/core_resources/apis.dart';
import '../../../shared/shared_models/core_models/app_version/app_version.dart';

@GetPut.repository()
class VersionsRemoteDataSource {
  Future<Either<NetworkException, AppVersionsList>> getVersions() async => await DioFunctions.get<AppVersionsList>(url: AppAPIs.apiGetVersions);
}
