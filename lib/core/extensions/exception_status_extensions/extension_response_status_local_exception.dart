import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';

extension LocalExceptionsExtension on ResponseStatusLocal {
  LocalException exception({StackTrace? stacktrace}) => LocalException(statusCode: statusCode, message: message, stackTrace: stacktrace);

  String get message => switch (this) {
    ResponseStatusLocal.nullException => Texts.to.storage.exceptionNull,
    ResponseStatusLocal.storageLoadDataException => Texts.to.storage.exceptionLoadData,
    ResponseStatusLocal.storageSaveDataException => Texts.to.storage.exceptionSaveData,
    ResponseStatusLocal.unknownException => Texts.to.storage.exceptionUnknown,
  };
}
