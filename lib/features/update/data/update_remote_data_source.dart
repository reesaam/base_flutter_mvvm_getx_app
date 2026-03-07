import 'dart:io';

import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';

abstract class UpdateRemoteDataSource {
  static UpdateRemoteDataSource get to => Get.find();

  Future<BaseAPIResponse<String>> getDownloadAddress();
  Future<BaseAPIResponse<String>> getAvailableVersion();
  Future<BaseAPIResponse<File?>> updateDownload({required String savePath});
}

@GetPut.repository(as: UpdateRemoteDataSource)
class UpdateRemoteDataSourceImpl extends CoreRepository implements UpdateRemoteDataSource {
  @override
  Future<BaseAPIResponse<String>> getDownloadAddress() async =>
      await DioCore.to.callMethod<String>(method: APIMethods.get, url: AppAPIUrls.apiGetUpdateAddress);

  @override
  Future<BaseAPIResponse<String>> getAvailableVersion() async =>
      await DioCore.to.callMethod<String>(method: APIMethods.get, url: AppAPIUrls.apiGetVersions);

  @override
  Future<BaseAPIResponse<File?>> updateDownload({required String savePath}) async =>
      await DioCore.to.download(url: AppAPIUrls.apiGetUpdateAPKDownload, savePath: savePath);
}
