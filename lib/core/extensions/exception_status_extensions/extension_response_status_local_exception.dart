import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';

extension LocalExceptionsExtension on ResponseStatusLocalException {
  LocalException exception({StackTrace? stacktrace}) => LocalException(statusCode: statusCode, message: message, stackTrace: stacktrace);

  String get message => switch (this) {
    ResponseStatusLocalException.nullException => Texts.to.storage.exceptionNull,
    ResponseStatusLocalException.storageLoadDataException => Texts.to.storage.exceptionLoadData,
    ResponseStatusLocalException.storageSaveDataException => Texts.to.storage.exceptionSaveData,
    ResponseStatusLocalException.unknownException => Texts.to.storage.exceptionUnknown,
  };
}
