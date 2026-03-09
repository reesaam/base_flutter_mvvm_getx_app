import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../app_storage_module_abstraction.dart';

@GetPut.component()
class AppSharedPreferences implements AppStorageModuleAbstraction {
  AppSharedPreferences() {
    _init();
  }

  late SharedPreferences _storage;
  void _init() async => _storage = await SharedPreferences.getInstance();

  @override
  Future<BaseLocalResponse<bool>> clear(String key) async {
    try {
      final response = await _storage.remove(key);
      appLogPrint('Storage Cleared Successfully');
      return response ? Right(response) : Left(_defaultLeftResponse);
    } on LocalException catch (ex, stackTrace) {
      _printException('CLEAR STORAGE', ex);
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex) {
      _printException('CLEAR STORAGE', GeneralException.create(ex));
      rethrow;
    }
  }

  @override
  Future<BaseLocalResponse<bool>> hasData(String key) async {
    try {
      final response = _storage.get(key);
      appLogPrint('Storage Read Successfully');
      return response != null ? const Right(true) : Left(_defaultLeftResponse);
    } on LocalException catch (ex, stackTrace) {
      _printException('CHECK', ex);
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex) {
      _printException('CHECK', GeneralException.create(ex));
      rethrow;
    }
  }

  @override
  Future<BaseLocalResponse<Map<String, dynamic>>> loadData(String key) async {
    try {
      String? data = _storage.getString(key);
      final result = data == null ? null : json.decode(data);
      appLogPrint('Data Loaded Successfully from $key');
      return result != null ? Right(result) : Left(_defaultLeftResponse);
    } on LocalException catch (ex, stackTrace) {
      _printException('LOAD', ex);
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex) {
      _printException('LOAD', GeneralException.create(ex));
      rethrow;
    }
  }

  @override
  Future<BaseLocalResponse<bool>> saveData({
    required String key,
    required Map<String, dynamic> data,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      String jsonData = json.encode(data);
      final result = await sp.setString(key, jsonData);
      appLogPrint('Data Saved Successfully');
      return result ?  Right(result) : Left(_defaultLeftResponse);
    } on LocalException catch (ex, stackTrace) {
      _printException('SAVE', ex);
      return Left(LocalException.handleResponse(ex, stackTrace));
    } catch (ex) {
      _printException('SAVE', GeneralException.create(ex));
      rethrow;
    }
  }

  static LocalException get _defaultLeftResponse => LocalExceptions.unknownException.exception;

  static _printException(String method, GeneralException exception) {
    appDebugPrint('==> Local $method Data Exception: ${exception.message} (${exception.statusCode})');
  }
}
