import '../../barrels/core_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class AppAlertWidgetDialogs {
  _onTapCancel() => popPage();

  withOkCancel({String? title, required Widget widget, required Function() onTapOk, bool? dismissible}) async {
    List<Widget> buttons = [
      AppButton.general(text: Texts.to.general.cancel, onTap: _onTapCancel),
      AppButton.general(text: Texts.to.general.ok, onTap: onTapOk),
    ];
    await _appAlertWidgetDialog(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
  }

  withOk({String? title, required Widget widget, required Function() onTapOk, bool? dismissible}) async {
    List<Widget> buttons = [AppButton.general(text: Texts.to.general.ok, onTap: onTapOk)];
    await _appAlertWidgetDialog(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
  }

  withoutButton({String? title, required Widget widget, bool? dismissible}) async {
    List<Widget> buttons = [];
    await _appAlertWidgetDialog(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
  }

  _appAlertWidgetDialog({String? title, required Widget widget, required List<Widget> buttons, bool? dismissible}) async => await showDialog(
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
        content: widget,
        actions: _renderButtonsAlertWidgetDialog(buttons),
        actionsOverflowAlignment: OverflowBarAlignment.center,
        actionsOverflowDirection: VerticalDirection.down,
        actionsAlignment: MainAxisAlignment.center,
      ),
    ),
  );

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
