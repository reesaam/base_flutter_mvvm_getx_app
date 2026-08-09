import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';

import '../app_storage_module_abstraction.dart';


@GetPut.component()
class AppLocalStorage implements AppStorageModuleAbstraction {
  AppLocalStorage() {
    _init();
  }

  late GetStorage _storage;
  void _init() => _storage = GetStorage();

  @override
  Future<BaseLocalResponse<bool>> clear(String key) async {
    try {
      _storage.remove(key);
      appLogPrint('App Data Cleared Successfully');
      return const Right(true);
    } on LocalException catch (ex, stackTrace) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      appLogPrint('Exception Occurred : $ex');
      rethrow;
    }
  }

  @override
  Future<BaseLocalResponse<bool>> hasData(String key) async {
    try {
      final response = _storage.hasData(key);
      return Right(response);
    } on LocalException catch (ex, stackTrace) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      appLogPrint('Exception Occurred : $ex');
      rethrow;
    }
  }

  @override
  Future<BaseLocalResponse<Map<String, dynamic>?>> loadData(String key) async {
    try {
      final data = _storage.read<String?>(key);
      appLogPrint('Data Loaded Successfully from $key');
      return Right(data == null ? null : convert.jsonDecode(data));
    } on LocalException catch (ex, stackTrace) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      appLogPrint('Exception Occurred : $ex');
      rethrow;
    }
  }

  @override
  Future<BaseLocalResponse<bool>> saveData({
    required String key,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _storage.write(key, convert.jsonEncode(data));
      appLogPrint('Data Saved Successfully on $key');
      return const Right(true);
    } on LocalException catch (ex, stackTrace) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      appLogPrint('Exception Occurred : $ex');
      rethrow;
    }
  }
}
