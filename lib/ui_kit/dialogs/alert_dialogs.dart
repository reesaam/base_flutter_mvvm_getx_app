import 'dart:async';

import '../../barrels/annotations_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

import 'alert_dialog_widget.dart';

@GetPut.component()
class AppAlertDialogs extends CoreComponent {
  static AppAlertDialogs get to => Get.find();

  Future<T?> oneButton<T>({
    String? title,
    required String buttonText,
    Widget? widget,
    String? text,
    required Function() onTapButton,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [AppButton.general(text: buttonText, onTap: onTapButton)];
    var result = await AppAlertDialogWidget.appAlertWidgetDialog<T, bool>(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
    return result.$1;
  }

  Future<(T1?, T2?)> twoButtons<T1, T2>({
    String? title,
    Widget? widget,
    String? text,
    required String buttonText1,
    required String buttonText2,
    required onTapButton1, // T1
    required onTapButton2, // T2
    bool? dismissible,
  }) async {
    List<Widget> buttons = [AppButton.general(text: buttonText1, onTap: onTapButton1), AppButton.general(text: buttonText2, onTap: onTapButton2)];
    var result = await AppAlertDialogWidget.appAlertWidgetDialog<T1, T2>(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
    return result;
  }

  Future<void> form({String? title, Widget? form, String? text, bool? dismissible}) async {
    await AppAlertDialogWidget.appAlertWidgetDialog(title: title, widget: form, dismissible: dismissible);
  }
}
