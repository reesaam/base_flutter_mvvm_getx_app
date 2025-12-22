export '../../../boiler_plates/boiler_plate_ui_kit.dart';

import '../../../core/core_functions.dart';
import '../../../core/core_resources/icons.dart';
import '../app_alert_widget_dialogs.dart';

showErrorDialog({String? title, required String message}) {
  Widget widget = Row(children: [AppIcons.error, Text(message)]);
  AppAlertWidgetDialogs().withOk(widget: widget, onTapOk: popPage);
}
