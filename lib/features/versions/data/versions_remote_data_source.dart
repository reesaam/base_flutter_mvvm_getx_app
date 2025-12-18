import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../../components/failures/network_exception.dart';
import '../../../components/network/dio_core.dart';
import '../../../core/core_resources/apis.dart';
import '../../../shared/shared_models/core_models/app_version/app_version.dart';

abstract class VersionsRemoteDataSource {
  static VersionsRemoteDataSource get to => Get.find();
  Future<Either<NetworkException, AppVersionsList>> getVersions();
}

@GetPut.repository(as: VersionsRemoteDataSource)
class VersionsRemoteDataSourceImpl implements VersionsRemoteDataSource {
  @override
  Future<Either<NetworkException, AppVersionsList>> getVersions() async =>
      await DioCore.to.callMethod<AppVersionsList>(method: APIMethods.get, url: AppAPIs.apiGetVersions);
}
