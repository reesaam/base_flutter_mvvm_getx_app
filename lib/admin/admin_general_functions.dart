import 'package:flutter/material.dart';

import '../core/app_localization.dart';
import '../core/extensions/extensions_on_data_types/extension_string.dart';
import '../ui_kit/buttons/app_general_button.dart';
import '../ui_kit/core_widgets.dart';
import '../ui_kit/general_widgets/dividers.dart';
import '../ui_kit/resources/paddings.dart';
import '../ui_kit/resources/spaces.dart';

class AdminFunctions {
  static section(List<Widget> section, {bool? isRow, String? title, Color? backgroundColor}) => Column(children: [
        title == null
            ? shrinkSizedBox
            : Column(children: [
                Text(title, style: const TextStyle(fontSize: 20)),
                AppDividers.settings,
              ]),
        Container(
          padding: AppPaddings.buttonXLarge,
          color: backgroundColor,
          child: isRow == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List<Widget>.generate(section.length, (index) => Expanded(child: section[index])),
                )
              : Column(children: section),
        ),
        AppDividers.generalWithDisabledColor,
      ]);

  static Widget item({String? title, String? text, Widget? widget, List<Widget>? multipleItems, bool? primary, bool? fullWidth}) => Column(children: [
        Padding(
            padding: fullWidth == true ? AppPaddings.zero : AppPaddings.buttonXLarge,
            child: text == null
                ? Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    title == null ? shrinkSizedBox : Text(title, textAlign: TextAlign.center),
                    title == null ? shrinkSizedBox : AppSpaces.h20,
                    Container(
                        padding: fullWidth == true ? AppPaddings.zero : const EdgeInsets.symmetric(horizontal: 20),
                        child: multipleItems == null
                            ? widget ?? shrinkSizedBox
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: multipleItems,
                              )),
                  ])
                : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(title?.withDoubleDots ?? Texts.to.empty),
                    Text(text),
                  ])),
      ]);

  static sectionGrid({required List<Widget> items, required String title}) {
    return Column(children: [
      Column(children: [Text(title, style: const TextStyle(fontSize: 20)), AppDividers.settings]),
      Padding(
          padding: AppPaddings.buttonXLarge,
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: items.length > 1 ? 4 : 8,
            crossAxisCount: items.length > 1 ? 2 : 1,
            children: List<Widget>.generate(items.length, (index) => items[index]),
          )),
      AppDividers.generalWithDisabledColor,
    ]);
  }

  static itemButton({required String text, required Function function}) => AppGeneralButton(text: text, onTap: () => function());
}
