import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/localization_barrel.dart';

class LoggerService extends CoreService {
  LoggerService._({String? message, required bool isDev}) {
    _logger(message: message, isDev: isDev);
  }

  factory LoggerService.log({required String message}) => LoggerService._(message: message, isDev: false);

  factory LoggerService.devLog({required String message}) => LoggerService._(message: message, isDev: true);

  void _logger({String? message, required bool isDev}) {
    String prefixLabel = isDev ? 'Debug' : 'LOG';
    String prefix = '[$prefixLabel]';
    String msg = '$prefix ${message ?? Texts.to.error.unknown}';
    // ignore: avoid_print
    isDev ? debugPrint(msg) : print(msg);
  }
}
