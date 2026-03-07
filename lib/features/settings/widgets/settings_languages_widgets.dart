import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

class SettingsLanguageWidget extends BaseWidget {
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
