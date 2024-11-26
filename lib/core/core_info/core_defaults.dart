import 'package:flutter/material.dart';

import '../core_resources/core_enums.dart';
import '../core_resources/countries.dart';

class CoreDefaults {
  ///Storage
  static AppStorageProvider get defaultStorageProvider => AppStorageProvider.getStorage;

  ///Localization
  static Locale get defaultLanguage => AppLanguages.english.locale;
  static AppCountry get defaultCountry => AppCountry.iran;
}