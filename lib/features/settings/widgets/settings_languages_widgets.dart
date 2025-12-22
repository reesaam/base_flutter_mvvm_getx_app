import '../../../boiler_plates/boiler_plate_ui_kit.dart';
export '../../../boiler_plates/boiler_plate_ui_kit.dart';

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
