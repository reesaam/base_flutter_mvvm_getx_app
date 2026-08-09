import '../../barrels/core_resources_barrel.dart';

abstract class AppStorageModuleAbstraction {
  Future<BaseLocalResponse<bool>> clear(String key);
  Future<BaseLocalResponse<bool>> hasData(String key);
  Future<BaseLocalResponse<Map<String, dynamic>?>> loadData(String key);
  Future<BaseLocalResponse<bool>> saveData({required String key, required Map<String, dynamic> data});
}
