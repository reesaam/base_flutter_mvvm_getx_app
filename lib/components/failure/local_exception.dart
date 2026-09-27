import '../../barrels/core_barrel.dart';

import '../../barrels/core_resources_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import 'general_exception.dart';

class LocalException implements GeneralException {
  LocalException({this.message, this.statusCode, this.stackTrace});

  @override
  final String? message;
  @override
  final int? statusCode;
  @override
  StackTrace? stackTrace;

  static LocalException handleResponse(GeneralException ex, StackTrace? stacktrace) {
    if (ex is LocalException) {
      return LocalException(message: ex.message, statusCode: ex.statusCode, stackTrace: stacktrace);
    }
    final exception =
        ResponseStatusLocal.values.firstWhereOrNull((e) => e.statusCode == ex.statusCode) ?? ResponseStatusLocal.unknownException;
    try {
      return exception.exception(stacktrace: stacktrace);
    } catch (_) {
      return LocalException(message: exception.message, statusCode: exception.statusCode, stackTrace: stacktrace);
    }
  }
}
