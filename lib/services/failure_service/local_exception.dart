import '../../barrels/core_barrel.dart';

import '../../barrels/core_resources_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import 'general_exception.dart';

class LocalException implements GeneralException {
  LocalException({this.message, this.statusCode});

  @override
  final String? message;
  @override
  final int? statusCode;

  static LocalException handleResponse(GeneralException ex, StackTrace? stacktrace) {
    if (ex is LocalException) {
      return LocalException(message: ex.message, statusCode: ex.statusCode);
    }
    final matched = ResponseStatusLocalException.values.firstWhereOrNull((e) => e.statusCode == ex.statusCode);
    if (matched == null) {
      return LocalException(message: ResponseStatusLocalException.unknownException.name, statusCode: 0);
    }
    try {
      return matched.exception;
    } catch (_) {
      return LocalException(message: matched.name, statusCode: matched.statusCode);
    }
  }
}
