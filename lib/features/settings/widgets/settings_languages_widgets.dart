import 'package:flutter/material.dart';

import '../../../../core/app_localization.dart';
import '../../../core/extensions/extensions_on_data_types/extension_locale.dart';
import '../../../ui_kit/resources/paddings.dart';

class SettingsLanguageWidget extends StatelessWidget {
  const SettingsLanguageWidget({super.key, this.function});

  final Function? function;

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          AppLocalization.languagesList.length,
          (index) => InkWell(
              onTap: function == null ? null : () => function!(index),
              child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      width: constraints.maxWidth,
                      padding: AppPaddings.modalItems,
                      child: Text(AppLocalization.languagesList[index].getLanguageName))))));
}
