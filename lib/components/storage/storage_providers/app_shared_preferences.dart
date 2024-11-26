import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core_functions.dart';
import '../../failures/local_exception.dart';
import '../app_storage_module_abstraction.dart';

@GetPut.component()
class AppSharedPreferences extends AppStorageModuleAbstraction {
  static AppSharedPreferences get to => Get.find();

  @override
  Future<Either<LocalException, bool>> clearStorage(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      final response = await sp.remove(key);
      appLogPrint('Storage Cleared Successfully');
      if (response) {
        return Right(response);
      } else {
        return Left(LocalException.handleResponse(false));
      }
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
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      final response = sp.get(key);
      return Right(response != null);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }

  @override
  Future<Either<LocalException, Map<String, dynamic>>> loadData(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      String? data = sp.getString(key);
      final result = data == null ? null : json.decode(data);
      appLogPrint('Data Loaded Successfully from $key');
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
  Future<Either<LocalException, bool>> saveData({
    required String key,
    required Map<String, dynamic> data,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      String jsonData = json.encode(data);
      final result = await sp.setString(key, jsonData);
      return Right(result);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }
}
