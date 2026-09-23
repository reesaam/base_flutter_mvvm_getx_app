import '../../barrels/core_resources_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class CoreDefaults {
  ///Storage
  static AppStorageProvider get defaultStorageProvider => AppStorageProvider.getStorage;

  ///Localization
  static Locale get defaultLanguage => AppLanguages.english.locale;
  static AppCountry get defaultCountry => AppCountry.iran;
}
