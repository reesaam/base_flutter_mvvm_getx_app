import '../../barrels/core_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class AppAlertDialogs {
  static withYesNo({String? title, required String text, required Function() onTapYes, Function()? onTapNo, bool? dismissible}) async {
    List<Widget> buttons = [
      AppButton.general(text: Texts.to.general.no, onTap: onTapNo ?? _onTapCancel),
      AppButton.general(text: Texts.to.general.yes, onTap: onTapYes),
    ];
    await _appAlertDialog(title: title, text: text, buttons: buttons, dismissible: dismissible);
  }

  static withOkCancel({String? title, required String text, required Function() onTapOk, Function()? onTapCancel, bool? dismissible}) async {
    List<Widget> buttons = [
      AppButton.general(text: Texts.to.general.cancel, onTap: onTapCancel ?? _onTapCancel),
      AppButton.general(text: Texts.to.general.ok, onTap: onTapOk),
    ];
    await _appAlertDialog(title: title, text: text, buttons: buttons, dismissible: dismissible);
  }

  static withOk({String? title, required String text, required Function() onTapOk, bool? dismissible}) async {
    List<Widget> buttons = [AppButton.general(text: Texts.to.general.ok, onTap: onTapOk)];
    await _appAlertDialog(title: title, text: text, buttons: buttons, dismissible: dismissible);
  }
}

_appAlertDialog({String? title, required String text, required List<Widget> buttons, bool? dismissible}) async => await showDialog(
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
      content: Padding(
        padding: AppPaddings.generalAlertDialog,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(text, softWrap: true)],
        ),
      ),
      actions: _renderButtonsAlertDialog(buttons),
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actionsOverflowDirection: VerticalDirection.down,
      actionsAlignment: MainAxisAlignment.center,
    ),
  ),
);

List<Widget> _renderButtonsAlertDialog(List<Widget> buttons) {
  List<Widget> list = List.empty(growable: true);
  int length = buttons.length;
  for (int i = 0; i < length; i++) {
    list.addIf(i == 0, AppBox.shrinkExpanded());
    list.add(AppBox.expanded(flex: length > 1 ? (30 ~/ length) : 2, child: buttons[i]));
    list.add(i == length - 1 ? AppBox.shrinkExpanded() : AppBox.shrinkExpanded(flex: 2));
  }
  return [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list)];
}

_onTapCancel() => popPage();
