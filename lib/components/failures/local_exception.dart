import 'package:getx_binding_annotation/annotation.dart';

import 'general_exception.dart';

@GetPut.component()
class LocalException implements GeneralException {
  LocalException({this.message, this.statusCode});

  @override
  final String? message;
  @override
  final int? statusCode;

  static LocalException handleResponse(ex) {
    switch (ex) {
      case null:
        throw NullException();
      case 203:
        throw StorageLoadDataException();
      case 204:
        throw StorageSaveDataException();
      default:
        throw UnknownException();
    }
  }
}

class StorageLoadDataException extends LocalException {
  StorageLoadDataException() : super(message: 'Storage Load Data Exception');
}

class StorageSaveDataException extends LocalException {
  StorageSaveDataException() : super(message: 'Storage Save Data Exception');
}

class NullException extends LocalException {
  NullException() : super(message: 'Null Exception');
}

class UnknownException extends LocalException {
  UnknownException() : super(message: 'Unknown Error');
}
