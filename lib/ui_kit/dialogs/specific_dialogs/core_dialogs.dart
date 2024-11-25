import 'package:flutter/material.dart';

import '../app_alert_widget_dialogs.dart';
import '../../../core/core_resources/icons.dart';
import '../../../core/core_functions.dart';

showErrorDialog({String? title, required String message}) {
  Widget widget = Row(children: [AppIcons.error, Text(message)]);
  AppAlertWidgetDialogs().withOk(widget: widget, onTapOk: popPage);
}
