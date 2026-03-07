import '../../barrels/core_barrel.dart';

import 'general_exception.dart';
import 'local_exceptions.dart';

export 'general_exception.dart';
export 'local_exceptions.dart';

class LocalException implements GeneralException {
  LocalException({this.message, this.statusCode});

  @override
  final String? message;
  @override
  final int? statusCode;

  static LocalException handleResponse(GeneralException ex, StackTrace? stacktrace) {
    final exception = LocalExceptions.values.firstWhereOrNull((e) => e.statusCode == ex.statusCode);
    throw exception != null ? exception.exception : LocalExceptions.unknownException.exception;
  }
}
