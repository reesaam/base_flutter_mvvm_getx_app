import '../../barrels/extensions_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class AppBottomSheetWidget {
  static Future<T?> appBottomSheetGeneral<T>({String? title, Widget? widget, String? text, List<Widget>? buttons, bool? dismissible}) async =>
      await showModalBottomSheet(
        context: Get.context!,
        useSafeArea: true,
        useRootNavigator: true,
        showDragHandle: true,
        isScrollControlled: true,
        isDismissible: dismissible ?? false,
        shape: AppElements.borderModal,
        builder: (context) => Padding(
          padding: AppPaddings.generalBottomModal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              innerWidget(title: title, text: text, widget: widget),
              AppSpaces.h40,
              renderButtonsBottomDialog(buttons),
            ],
          ),
        ),
      );

  static Widget innerWidget({String? title, Widget? widget, String? text}) => SingleChildScrollView(
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

  static Widget renderButtonsBottomDialog(List<Widget>? buttons) {
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
