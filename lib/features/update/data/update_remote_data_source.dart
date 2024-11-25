import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../components/network/dio_functions.dart';
import '../../../core/core_resources/apis.dart';

@GetPut.repository()
class UpdateRemoteDataSource {
  Future<Either<Exception, String>> getDownloadAddress() async => await DioFunctions.get<String>(url: AppAPIs.apiGetUpdateAddress);

  Future<Either<Exception, String>> getAvailableVersion() async => await DioFunctions.get<String>(url: AppAPIs.apiGetVersions);

  Future<Either<Exception, File?>> updateDownload({required String savePath}) async =>
      await DioFunctions.download(url: AppAPIs.apiGetUpdateAPKDownload, savePath: savePath);
}
