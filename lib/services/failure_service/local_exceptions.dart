import '../../barrels/localization_barrel.dart';
import 'local_exception.dart';

enum LocalExceptions {
  nullException(statusCode: 0),
  storageLoadDataException(statusCode: 0),
  storageSaveDataException(statusCode: 0),
  unknownException(statusCode: 0);

  final int statusCode;
  const LocalExceptions({required this.statusCode});
}

extension LocalExceptionsExtension on LocalExceptions {
  LocalException get exception => LocalException(statusCode: statusCode, message: message);

  String get message => switch (this) {
    LocalExceptions.nullException => Texts.to.storage.exceptionNull,
    LocalExceptions.storageLoadDataException => Texts.to.storage.exceptionLoadData,
    LocalExceptions.storageSaveDataException => Texts.to.storage.exceptionSaveData,
    LocalExceptions.unknownException => Texts.to.storage.exceptionUnknown,
  };
}
