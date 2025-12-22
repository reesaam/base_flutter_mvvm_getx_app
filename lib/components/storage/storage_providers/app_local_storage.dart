import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../../core/core_functions.dart';
import '../../../core/core_resources/defined_types.dart';
import '../../failures/local_exception.dart';
import '../app_storage_module_abstraction.dart';
import 'local_storage_service.dart';

@GetPut.component()
class AppLocalStorage implements AppStorageModuleAbstraction {
  final _service = LocalStorageService();

  @override
  Future<BaseLocalResponse<bool>> clear(String key) async {
    try {
      final result = _service.remove(key);
      appLogPrint('App Data Cleared Successfully');
      return Right(result);
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
      final response = _service.hasData(key);
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
      final data = _service.read(key);
      appLogPrint('Data Loaded Successfully from $key');
      return Right(data);
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
      await _service.write(key, data);
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
