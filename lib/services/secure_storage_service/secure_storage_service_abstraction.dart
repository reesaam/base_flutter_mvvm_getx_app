import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';

abstract class SecureStorageService extends CoreService {
  static SecureStorageService get to => Get.find();

  Future<BaseLocalResponse<T?>> read<T>(AppStorageKeys key);
  Future<BaseLocalResponse<bool>> write<T>({required AppStorageKeys key, required T value});
  Future<BaseLocalResponse<bool>> remove(AppStorageKeys? key);
  Future<BaseLocalResponse<bool>> hasData(AppStorageKeys key);
}
