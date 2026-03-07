
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../core_resources/core_enums.dart';

extension OnTranslation on Translation {
  AppLanguages? get getLanguage => AppLanguages.values.firstWhereOrNull((element) => element.locale.languageCode == language.languageCode);
}

extension OnAppLanguages on AppLanguages {
  String get localLanguageName => languageName == AppLanguages.persian.languageName ? AppTexts.languageNamePersian : languageName;
}

extension ExtensionLanguageModel on Locale {
  AppLanguages get getLanguage {
    AppLanguages language = AppLanguages.english;
    for (var lang in AppLanguages.values) {
      if (languageCode == lang.locale.languageCode) {
        language = lang;
      }
    }
    return language;
  }
}
