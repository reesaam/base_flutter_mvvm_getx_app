import '../../core_functions.dart';

extension ExtensionOnFunctionsDebugPrint on Future<bool> {
  Future<bool> withStatusPrint({bool? isLog, String? featureName, String? message, String? successfulMessage, String? failureMessage}) =>
      then((value) {
        ///WARNING:
        ///Do not use Localization(Texts) and [context] depended sources,
        ///Some places this Function is using in Initializations and [context] is Absent there

        String successfulMsg = message ?? successfulMessage ?? '$featureName Function Successful Performed';
        String failureMsg = message ?? failureMessage ?? '$featureName Function Failed';
        if (isLog == true) {
          value ? appLogPrint(successfulMsg) : appLogPrint(failureMsg);
        } else {
          value ? appDebugPrint(successfulMsg) : appDebugPrint(failureMsg);
        }
        return value;
      });
}