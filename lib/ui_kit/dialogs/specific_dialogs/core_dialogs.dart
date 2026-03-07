import '../../../barrels/core_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

showErrorDialog({String? title, required String message}) {
  Widget widget = Row(children: [AppIcons.error.widget, Text(message)]);
  AppAlertWidgetDialogs().withOk(widget: widget, onTapOk: popPage);
}
