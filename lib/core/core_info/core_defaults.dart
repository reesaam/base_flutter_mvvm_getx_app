import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';

class CoreDefaults {
  ///Storage
  static AppStorageProvider get defaultStorageProvider => AppStorageProvider.getStorage;

  ///Localization
  static Locale get defaultLanguage => AppLanguages.english.locale;
  static AppCountry get defaultCountry => AppCountry.iran;
}
