export '../../ui_kit_barrel.dart';

import '../../../core/core_functions.dart';
import '../app_alert_widget_dialogs.dart';

showErrorDialog({String? title, required String message}) {
  Widget widget = Row(children: [AppIcons.error.widget, Text(message)]);
  AppAlertWidgetDialogs().withOk(widget: widget, onTapOk: popPage);
}
