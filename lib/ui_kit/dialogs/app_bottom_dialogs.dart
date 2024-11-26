import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_localization.dart';
import '../../core/core_functions.dart';
import '../buttons/app_general_button.dart';
import '../core_widgets.dart';
import '../general_widgets/dividers.dart';
import '../resources/elements.dart';
import '../resources/paddings.dart';
import '../resources/spaces.dart';

class AppBottomDialogs {
  _onTapCancel() => popPage();

  withoutButton({String? title, required Widget form, bool? dismissible}) async {
    List<Widget> buttons = [];
    await _appBottomDialogGeneral(title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  withOk({String? title, required Widget form, required Function() onTapOk, bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(
        text: Texts.to.ok,
        onTap: onTapOk,
        primaryColor: true,
      )
    ];
    await _appBottomDialogGeneral(title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  withCancel({String? title, required Widget form, bool? dismissible}) async {
    List<Widget> buttons = [AppGeneralButton(onSecondaryColor: true, text: Texts.to.cancel, onTap: _onTapCancel)];
    await _appBottomDialogGeneral(title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  withOkCancel({String? title, required Widget form, required Function() onTapOk, bool? dismissible}) async {
    List<Widget> buttons = [
      AppGeneralButton(onSecondaryColor: true, text: Texts.to.cancel, onTap: () => _onTapCancel()),
      AppGeneralButton(
        text: Texts.to.ok,
        onTap: () => onTapOk(),
        primaryColor: true,
      ),
    ];
    await _appBottomDialogGeneral(title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  tappableItem({required String text, required Function() onTap}) => LayoutBuilder(
      builder: (context, constraints) => InkWell(
          onTap: onTap,
          child: SizedBox(
            width: constraints.maxWidth,
            height: 50,
            child: Text(text),
          )));

  _appBottomDialogGeneral({String? title, required Widget form, required List<Widget> buttons, bool? dismissible}) async =>
      await showModalBottomSheet(
          context: Get.context!,
          useSafeArea: true,
          useRootNavigator: true,
          showDragHandle: true,
          isScrollControlled: true,
          isDismissible: dismissible ?? false,
          shape: AppElements.borderShapeModal,
          builder: (context) => SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                Padding(
                    padding: AppPaddings.generalBottomModal,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        title == null
                            ? shrinkSizedBox
                            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(title ?? Texts.to.empty),
                                AppDividers.generalWithPrimaryColor,
                                AppSpaces.h10,
                              ]),
                        form,
                      ]),
                      AppSpaces.h40,
                      _renderButtonsBottomDialog(buttons),
                    ])),
                AppSpaces.h20,
              ])));

  Widget _renderButtonsBottomDialog(List<Widget> buttons) {
    List<Widget> list = List.empty(growable: true);
    int length = buttons.length;
    for (int i = 0; i < length; i++) {
      list.addIf(i == 0, shrinkOneExpanded);
      list.add(Expanded(flex: length > 1 ? (30 ~/ length) : 4, child: buttons[i]));
      list.add(i == length - 1 ? shrinkOneExpanded : shrinkExpanded(5));
    }
    return Padding(
      padding: AppPaddings.buttonXLarge,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list),
    );
  }
}
