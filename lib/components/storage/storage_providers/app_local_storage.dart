import 'package:dartz/dartz.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../failures/local_exception.dart';
import '../../../core/core_resources/core_enums.dart';
import '../../../core/core_functions.dart';
import '../app_storage_module_abstraction.dart';
import 'local_storage_service.dart';

@GetPut.component()
class AppLocalStorage implements AppStorageModuleAbstraction {
  final String _keyLocalStorage = 'Local Storage';
  final _service = LocalStorageService();

  @override
  Future<Either<LocalException, bool>> clearStorage(String key) async {
    try {
      final result = _service.remove(key);
      appLogPrint('App Data Cleared Successfully');
      return Right(result);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }

  @override
  Future<Either<LocalException, bool>> hasData(String key) async {
    try {
      final response = _service.hasData(key);
      return Right(response);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }

  @override
  Future<Either<LocalException, Map<String, dynamic>?>> loadData(String key) async {
    try {
      final data = _service.read(key);
      appLogPrint('Data Loaded Successfully from $key');
      return Right(data);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }

  @override
  Future<Either<LocalException, bool>> saveData({
    required String key,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _service.write(key, data);
      appLogPrint('Data Saved Successfully on $key');
      return const Right(true);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }
}
