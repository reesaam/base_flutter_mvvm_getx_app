import 'package:dartz/dartz.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../core/core_resources/core_enums.dart';
import '../failures/local_exception.dart';

abstract class AppStorageModuleAbstraction {
  Future<Either<LocalException, bool>> clearStorage(String key);
  Future<Either<LocalException, bool>> hasData(String key);
  Future<Either<LocalException, Map<String, dynamic>?>> loadData(String key);
  Future<Either<LocalException, bool>> saveData({required String key, required Map<String, dynamic> data});
}
