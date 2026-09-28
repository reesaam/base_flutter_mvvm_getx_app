import '../../barrels/annotations_barrel.dart';
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
    var result = await _appBottomSheetGeneral<T, bool>(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
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
    var result = await _appBottomSheetGeneral<T1, T2>(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
    return result;
  }

  Future<void> form({String? title, Widget? form, String? text, bool? dismissible}) async {
    await _appBottomSheetGeneral(title: title, widget: form, dismissible: dismissible);
  }

  void tappableItem({required String text, required Function() onTap}) => LayoutBuilder(
    builder: (context, constraints) => InkWell(
      onTap: onTap,
      child: SizedBox(width: constraints.maxWidth, height: 50, child: Text(text)),
    ),
  );

  Future<(T1?, T2?)> _appBottomSheetGeneral<T1, T2>({String? title, Widget? widget, String? text, List<Widget>? buttons, bool? dismissible}) async =>
      await showModalBottomSheet(
        context: Get.context!,
        useSafeArea: true,
        useRootNavigator: true,
        showDragHandle: true,
        isScrollControlled: true,
        isDismissible: dismissible ?? false,
        shape: AppElements.borderShapeModal,
        builder: (context) => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: AppPaddings.generalBottomModal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title == null
                            ? AppBox.shrink()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text(title), AppDividers.generalWithPrimaryColor, AppSpaces.h10],
                              ),
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
                      ],
                    ),
                    AppSpaces.h40,
                    _renderButtonsBottomDialog(buttons ?? List<Widget>.empty()),
                  ],
                ),
              ),
              AppSpaces.h20,
            ],
          ),
        ),
      );

  Widget _renderButtonsBottomDialog(List<Widget> buttons) {
    List<Widget> list = List.empty(growable: true);
    int length = buttons.length;
    for (int i = 0; i < length; i++) {
      list.addIf(i == 0, AppBox.shrinkExpanded());
      list.add(AppBox.expanded(flex: length > 1 ? (30 ~/ length) : 4, child: buttons[i]));
      list.add(i == length - 1 ? AppBox.shrinkExpanded() : AppBox.shrinkExpanded(flex: 5));
    }
    return Padding(
      padding: AppPaddings.buttonXLarge,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list),
    );
  }
}
