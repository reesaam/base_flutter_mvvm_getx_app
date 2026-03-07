import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

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
