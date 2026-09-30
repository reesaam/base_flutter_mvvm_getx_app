import '../../barrels/annotations_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

@GetPut.component()
class AppBottomSheet {
  static AppBottomSheet get to => Get.find();

  Future<T?> oneButton<T>({
    String? title,
    required String buttonText,
    Widget? widget,
    String? text,
    required Function() onTapButton,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [AppButton.general(text: buttonText, onTap: onTapButton)];
    var result = await _appBottomSheetGeneral<T>(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
    return result;
  }

  Future<T?> twoButtons<T>({
    String? title,
    Widget? widget,
    String? text,
    required String buttonText1,
    required String buttonText2,
    required Function() onTapButton1,
    required Function() onTapButton2,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [AppButton.general(text: buttonText1, onTap: onTapButton1), AppButton.general(text: buttonText2, onTap: onTapButton2)];
    var result = await _appBottomSheetGeneral<T>(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
    return result;
  }

  Future<void> form({String? title, Widget? form, Widget? buttons, bool? dismissible}) async {
    await _appBottomSheetGeneral(title: title, widget: form, buttons: buttons == null ? [] : [buttons], dismissible: dismissible);
  }

  // void tappableItem({required String text, required Function() onTap}) => LayoutBuilder(
  //   builder: (context, constraints) => InkWell(
  //     onTap: onTap,
  //     child: SizedBox(width: constraints.maxWidth, height: 50, child: Text(text)),
  //   ),
  // );

  Future<T?> _appBottomSheetGeneral<T>({String? title, Widget? widget, String? text, List<Widget>? buttons, bool? dismissible}) async =>
      await showModalBottomSheet(
        context: Get.context!,
        useSafeArea: true,
        useRootNavigator: true,
        showDragHandle: true,
        isScrollControlled: true,
        isDismissible: dismissible ?? false,
        shape: AppElements.borderShapeModal,
        builder: (context) => Padding(
          padding: AppPaddings.generalBottomModal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _widget(title: title, text: text, widget: widget),
              AppSpaces.h40,
              _renderButtonsBottomDialog(buttons),
            ],
          ),
        ),
      );

  Widget _widget({String? title, Widget? widget, String? text}) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Widget
        if (title.isNullOrEmpty)
          Padding(
            padding: AppPaddings.generalAlertDialog,
            child: Column(
              children: [
                Text(title ?? ''),
                AppDividers.general(color: AppColors.primary),
              ],
            ),
          ),
        // Main Widget
        (widget ??
            Padding(
              padding: AppPaddings.generalAlertDialog,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text(text ?? Texts.to.general.notAvailable, softWrap: true)],
              ),
            )),
      ],
    ),
  );

  Widget _renderButtonsBottomDialog(List<Widget>? buttons) {
    List<Widget> buttonWidgetList = List.empty(growable: true);
    int length = buttons?.length ?? 0;
    for (int i = 0; i < length; i++) {
      buttonWidgetList.addIf(i == 0, AppBox.shrinkExpanded());
      buttonWidgetList.add(AppBox.expanded(flex: length > 1 ? (30 ~/ length) : 4, child: buttons?[i]));
      buttonWidgetList.add(i == length - 1 ? AppBox.shrinkExpanded() : AppBox.shrinkExpanded(flex: 5));
    }
    return Padding(
      padding: AppPaddings.buttonXLarge,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: buttonWidgetList),
    );
  }
}
