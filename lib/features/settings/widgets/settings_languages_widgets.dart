import 'package:flutter/material.dart';

import '../../../core/extensions/data_types_extensions/extension_language.dart';
import '../../../localization/localizations.dart';
import '../../../ui_kit/resources/paddings.dart';

class SettingsLanguageWidget extends StatelessWidget {
  const SettingsLanguageWidget({super.key, this.function});

  final Function? function;

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          AppLocalizations.supportedLocales.length,
          (index) => InkWell(
              onTap: function == null ? null : () => function!(index),
              child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      width: constraints.maxWidth,
                      padding: AppPaddings.modalItems,
                      child: Text(AppLocalizations.supportedLocales[index].getLanguage.languageName))))));
}
