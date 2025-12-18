import '../../localization/localizations.dart';
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
        LocalExceptions.nullException => Texts.to.error.storage.nullExceptionMessage,
        LocalExceptions.storageLoadDataException => Texts.to.error.storage.loadDataExceptionMessage,
        LocalExceptions.storageSaveDataException => Texts.to.error.storage.saveDataExceptionMessage,
        LocalExceptions.unknownException => Texts.to.error.storage.unknownExceptionMessage,
      };
}
