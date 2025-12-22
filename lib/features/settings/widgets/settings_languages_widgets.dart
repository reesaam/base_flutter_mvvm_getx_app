import '../../../ui_kit/ui_kit_barrel.dart';
export '../../../ui_kit/ui_kit_barrel.dart';

import '../../../core/extensions/data_types_extensions/extension_language.dart';
import '../../../localization/localizations.dart';
import '../../../ui_kit/resources/paddings.dart';

class SettingsLanguageWidget extends AppWidget {
  const SettingsLanguageWidget({super.key, this.function});

  final Function? function;

  @override
  Widget get widget => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          AppLocalizations.to.supportedLocales.length,
          (index) => InkWell(
              onTap: function == null ? null : () => function!(index),
              child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      width: constraints.maxWidth,
                      padding: AppPaddings.modalItems,
                      child: Text(AppLocalizations.to.supportedLocales[index].getLanguage.languageName))))));
}
