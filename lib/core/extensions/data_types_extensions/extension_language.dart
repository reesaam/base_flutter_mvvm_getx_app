import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../localization/translation.i69n.dart';
import '../../core_resources/core_enums.dart';
import '../../core_resources/texts.dart';

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
