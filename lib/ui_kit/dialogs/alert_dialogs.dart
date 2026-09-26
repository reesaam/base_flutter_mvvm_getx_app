import 'dart:async';

import '../../barrels/annotations_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

//: assert((text == null && widget == null) || (text != null && widget != null), AppAssertTexts.buttonsCheckNullInputs);

@GetPut.component()
class AppAlertDialogs extends CoreComponent {
  static AppAlertDialogs get to => Get.find();

  void _onTapCancel() => popPage();

  Future<T?> withOneButton<T>({
    String? title,
    required String buttonText,
    Widget? widget,
    String? text,
    required Function() onTapOk,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [AppButton.general(text: buttonText, onTap: onTapOk)];
    var result = await _appAlertWidgetDialog<T, bool>(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
    return result.$1;
  }

  Future<(T1?, T2?)> withTwoButtons<T1, T2>({
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
    var result = await _appAlertWidgetDialog<T1, T2>(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
    return result;
  }

  Future<void> withoutButton({String? title, Widget? widget, String? text, bool? dismissible}) async {
    await _appAlertWidgetDialog(title: title, widget: widget, dismissible: dismissible);
  }

  Future<(T1?, T2?)> _appAlertWidgetDialog<T1, T2>({String? title, Widget? widget, String? text, List<Widget>? buttons, bool? dismissible}) async {
    assert((text == null && widget == null) || (text != null && widget != null), AppAssertTexts.buttonsCheckNullInputs);
    return await showDialog(
      context: Get.context!,
      useSafeArea: true,
      useRootNavigator: true,
      barrierDismissible: dismissible ?? false,
      builder: (context) => AppContainer(
        padding: AppPaddings.generalAlertDialog,
        child: AlertDialog.adaptive(
          scrollable: true,
          shape: AppElements.borderShapeAlertDialog,
          title: title == null
              ? AppBox.shrink()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(title), AppDividers.generalWithPrimaryColor],
                ),
          content:
              widget ??
              Padding(
                padding: AppPaddings.generalAlertDialog,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text(text ?? Texts.to.general.notAvailable, softWrap: true)],
                ),
              ),
          actions: _renderButtonsAlertWidgetDialog(buttons ?? List<Widget>.empty()),
          actionsOverflowAlignment: OverflowBarAlignment.center,
          actionsOverflowDirection: VerticalDirection.down,
          actionsAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }

  List<Widget> _renderButtonsAlertWidgetDialog(List<Widget> buttons) {
    List<Widget> list = List.empty(growable: true);
    int length = buttons.length;
    for (int i = 0; i < length; i++) {
      list.addIf(i == 0, AppBox.shrinkExpanded());
      list.add(AppBox.expanded(flex: length > 1 ? (30 ~/ length) : 2, child: buttons[i]));
      list.add(i == length - 1 ? AppBox.shrinkExpanded() : AppBox.shrinkExpanded(flex: 2));
    }
    return [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list)];
  }
}
