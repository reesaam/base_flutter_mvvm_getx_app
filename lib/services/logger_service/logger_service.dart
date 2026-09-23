import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/localization_barrel.dart';

class LoggerService extends CoreService {
  LoggerService();

  static LoggerService get to => Get.find();

  void log({required String message}) => _logger(isDev: false, message: message);
  void devLog({required String message}) => CoreFlags.isRelease ? nullFunction() : _logger(isDev: true, message: message);

  // Main Logger Function
  void _logger({String? message, required bool isDev}) {
    String prefixLabel = isDev ? 'Debug' : 'LOG';
    String prefix = '[$prefixLabel]';
    String msg = '$prefix ${message ?? Texts.to.error.unknown}';
    // ignore: avoid_print
    isDev ? debugPrint(msg) : print(msg);
  }
}
