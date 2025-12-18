import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../../components/network/dio_core.dart';
import '../../../core/core_resources/apis.dart';

abstract class UpdateRemoteDataSource {
  static UpdateRemoteDataSource get to => Get.find();

  Future<Either<Exception, String>> getDownloadAddress();
  Future<Either<Exception, String>> getAvailableVersion();
  Future<Either<Exception, File?>> updateDownload({required String savePath});
}

@GetPut.repository(as: UpdateRemoteDataSource)
class UpdateRemoteDataSourceImpl implements UpdateRemoteDataSource {
  @override
  Future<Either<Exception, String>> getDownloadAddress() async =>
      await DioCore.to.callMethod<String>(method: APIMethods.get, url: AppAPIs.apiGetUpdateAddress);

  @override
  Future<Either<Exception, String>> getAvailableVersion() async =>
      await DioCore.to.callMethod<String>(method: APIMethods.get, url: AppAPIs.apiGetVersions);

  @override
  Future<Either<Exception, File?>> updateDownload({required String savePath}) async =>
      await DioCore.to.download(url: AppAPIs.apiGetUpdateAPKDownload, savePath: savePath);
}
