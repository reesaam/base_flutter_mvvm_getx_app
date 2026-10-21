import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class AppBottomSheetWidget {
  static Future<T?> appBottomSheetGeneral<T>({
    String? title,
    Widget? widget,
    String? text,
    List<Widget>? buttons,
    bool? dismissible,
  }) async => await showModalBottomSheet(
    context: Get.context!,
    useSafeArea: true,
    useRootNavigator: true,
    isScrollControlled: true,
    showDragHandle: true,
    isDismissible: dismissible ?? false,
    shape: AppElements.borderModal,
    barrierColor: AppColors.transparent.color,
    builder: (context) => ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: AppDefaults.bottomSheetMaxHeight,
        minHeight: AppDefaults.bottomSheetMinHeight,
      ),
      child: Padding(
        padding: AppPaddings.only(bottom: Get.mediaQuery.viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (title.isNotNullOrEmpty) _title(title),
              AppSpaces.h20,
              _bodyBuilder(widget: widget, text: text),
              AppSpaces.h20,
              renderButtonsBottomDialog(buttons),
            ],
          ),
        ),
      ),
    ),
  );

  static Widget _title(String? title) => Padding(
    padding: AppPaddings.generalAlertDialog,
    child: Column(
      children: [
        Text(title ?? '').withTitleSmallSize.copyWith(textColor: AppColors.primary),
        AppDividers.general(color: AppColors.primary),
      ],
    ),
  );

  static Widget _bodyBuilder({Widget? widget, String? text}) => Padding(
    padding: AppPaddings.generalAlertDialog,
    child:
        (widget ??
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(text ?? Texts.to.general.notAvailable, softWrap: true)],
        )),
  );

  static Widget renderButtonsBottomDialog(List<Widget>? buttons) {
    List<Widget> buttonWidgetList = createEmptyList<Widget>();
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
