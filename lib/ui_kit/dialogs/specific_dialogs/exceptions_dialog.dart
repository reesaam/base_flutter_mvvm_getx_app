import '../../ui_kit_barrel.dart';
export '../../ui_kit_barrel.dart';

import '../../../components/failures/general_exception.dart';
import '../../../core/core_functions.dart';
import '../../../localization/localizations.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';

class AppExceptionsDialog extends AppAlertDialogs {
  static show({required GeneralException exception, String? message, int? statusCode, Function()? onTap}) async {
    await AppAlertDialogs.withOk(
      title: statusCode != null
          ? 'Error: ${statusCode.toString()}'
          : exception.statusCode?.toString() ?? Texts.to.error.unknown,
      text: message ?? exception.message ?? Texts.to.error.unknown,
      onTapOk: onTap ?? popPage,
    );
  }
}
