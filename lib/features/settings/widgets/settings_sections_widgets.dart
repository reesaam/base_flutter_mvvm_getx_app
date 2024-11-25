import 'package:flutter/material.dart';

import '../../../core/extensions/extensions_on_material_widgets/extension_on_text.dart';
import '../../../ui_kit/core_widgets.dart';
import '../../../ui_kit/general_widgets/dividers.dart';
import '../../../ui_kit/resources/paddings.dart';

///Whole Widget
class SettingsSectionWidget extends StatelessWidget {
  final String title;
  final List<Widget> widgets;
  const SettingsSectionWidget({super.key, required this.title, required this.widgets});

  Widget _title(String text) => Text(text).withDisabledColor;

  @override
  Widget build(BuildContext context) => Padding(
      padding: AppPaddings.settingsSection,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _title(title),
        AppDividers.settings,
        Column(children: widgets),
      ]));
}

///Items Widget
class SettingsSectionItemWidget extends StatelessWidget {
  final String text;
  final Widget? leading;
  final Function? wholeItemFunction;

  const SettingsSectionItemWidget({super.key, required this.text, this.leading, this.wholeItemFunction});

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: wholeItemFunction == null ? null : () => wholeItemFunction!(),
      child: Padding(
          padding: AppPaddings.settingsItem,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(text),
            leading ?? shrinkSizedBox,
          ])));
}
