import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class AppAlertDialogWidget {
  static Future<(T1?, T2?)?> appAlertWidgetDialog<T1, T2>({
    String? title,
    Widget? widget,
    String? text,
    List<Widget>? buttons,
    bool? dismissible,
  }) async {
    // assert((text == null && widget == null) || (text != null && widget != null), AppAssertTexts.buttonsCheckNullInputs);
    return await showDialog(
      context: Get.context!,
      fullscreenDialog: false,
      barrierColor: AppColors.transparent.color,
      useSafeArea: true,
      useRootNavigator: true,
      barrierDismissible: dismissible ?? false,
      builder: (context) => AppContainer(
        height: Get.height / 2,
        color: AppColors.transparent,
        padding: AppPaddings.generalAlertDialog,
        child: AlertDialog(
          scrollable: true,
          backgroundColor: AppColors.transparent.color,
          elevation: 10,
          shape: AppElements.borderShapeAlertDialog,
          title: title == null
              ? AppBox.shrink()
              : AppCard.outline(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      AppDividers.general(color: AppColors.primary),
                    ],
                  ),
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

  static List<Widget> _renderButtonsAlertWidgetDialog(List<Widget> buttons) {
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
