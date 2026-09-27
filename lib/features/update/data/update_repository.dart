import 'dart:io';

import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/services_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';

abstract class UpdateRepository extends CoreRepository {
  static UpdateRepository get to => Get.find();

  Future<BaseResponse<String>> getDownloadAddress();
  Future<BaseResponse<String>> getAvailableVersion();
  Future<BaseResponse<File?>> updateDownload({required String savePath});
}

@GetPut.repository(as: UpdateRepository)
class UpdateRepositoryImpl extends CoreRepository implements UpdateRepository {
  @override
  Future<BaseResponse<String>> getDownloadAddress() async =>
      await DioCore.to.callMethod<String>(method: APIMethods.get, url: AppAPIUrls.apiGetUpdateAddress);

  @override
  Future<BaseResponse<String>> getAvailableVersion() async =>
      await DioCore.to.callMethod<String>(method: APIMethods.get, url: AppAPIUrls.apiGetVersions);

  @override
  Future<BaseResponse<File?>> updateDownload({required String savePath}) async =>
      await DioCore.to.download(url: AppAPIUrls.apiGetUpdateAPKDownload, savePath: savePath);
}
