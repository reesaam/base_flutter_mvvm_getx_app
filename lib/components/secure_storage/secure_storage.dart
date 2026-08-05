import 'package:get_secure_storage/get_secure_storage.dart';

import '../../barrels/annotations_barrel.dart';
import '../../barrels/components_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';

abstract class SecureStorageModule extends CoreComponent {
  static SecureStorageModule get to => Get.find();
  Future<void> init(String password);
  Future<BaseLocalResponse<T?>> read<T>(AppStorageKeys key);
  Future<BaseLocalResponse<bool>> write<T>({required AppStorageKeys key, required T value});
  Future<BaseLocalResponse<bool>> remove(AppStorageKeys? key);
  Future<BaseLocalResponse<bool>> hasData(AppStorageKeys key);
}

@GetPut.component(as: SecureStorageModule)
class SecureStorageModuleImpl extends CoreComponent implements SecureStorageModule {
  static GetSecureStorage get _storage => GetSecureStorage();

  @override
  Future<void> init(String password) async =>
      await GetSecureStorage.init(password: password, container: AppStorageKeys.appSecureStorage.name);

  @override
  Future<BaseLocalResponse<T?>> read<T>(AppStorageKeys key) async {
    try {
      final data = _storage.read<T>(key.name);
      appDebugPrint('SecureStorage : Data Loaded Successfully from $key');
      return Right(data);
    } on LocalException catch (ex, stackTrace) {
      appDebugPrint('SecureStorage : Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      appDebugPrint('Exception Occurred : $ex');
      rethrow;
    }
  }

  @override
  Future<BaseLocalResponse<bool>> write<T>({required AppStorageKeys key, required T value}) async {
    try {
      await _storage.write(key.name, value);
      appDebugPrint('SecureStorage : Data Loaded Successfully from $key');
      return const Right(true);
    } on LocalException catch (ex, stackTrace) {
      appDebugPrint('SecureStorage : Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      appDebugPrint('Exception Occurred : $ex');
      rethrow;
    }
  }

  @override
  Future<BaseLocalResponse<bool>> remove(AppStorageKeys? key) async {
    try {
      if (key == null) {
        await _storage.erase();
      } else {
        await _storage.remove(key.name);
      }
      appDebugPrint('Secure Storage Cleared Successfully');
      return const Right(true);
    } on LocalException catch (ex, stackTrace) {
      appDebugPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      appDebugPrint('Exception Occurred : $ex');
      rethrow;
    }
  }

  @override
  Future<BaseLocalResponse<bool>> hasData(AppStorageKeys key) async {
    try {
      final result = _storage.hasData(key.name);
      appDebugPrint('App Data Cleared Successfully');
      return Right(result);
    } on LocalException catch (ex, stackTrace) {
      appDebugPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      appDebugPrint('Exception Occurred : $ex');
      rethrow;
    }
  }
}
