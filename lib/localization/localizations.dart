import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart';

import '../core/core_functions.dart';
import '../core/core_info/core_defaults.dart';
import '../core/core_resources/countries.dart';
import '../core/extensions/extensions_on_data_types/extension_languages.dart';
import '../core/extensions/extensions_on_data_types/extension_list.dart';
import '../core/extensions/extensions_on_data_types/extension_time_zone.dart';
import '../shared/shared_models/core_models/app_settings_data/app_setting_data.dart';

//Languages Import
import 'translation.i69n.dart';
import 'translation_fa.i69n.dart';

const _supportedLocales = ['en', 'fa'];

class Texts {
  Texts._();
  static Translation get to => AppLocalizations.of(Get.context!);
}

class AppLocalizations {
  AppLocalizations({this.translation});

  static AppLocalizations get to => Get.find();

  final Translation? translation;

  static final _translation = <String, Translation Function()>{
    'en': () => const Translation(),
    'fa': () => const Translation_fa(),
  };

  get localizationDelegates => const _AppLocalizationsDelegate();

  List<Locale> get supportedLocales => _supportedLocales.map((x) => Locale(x)).toList();

  static Future<AppLocalizations> load(Locale locale) => Future.value(AppLocalizations(translation: _translation[locale.languageCode]!()));

  static Translation of(BuildContext context) => AppLocalizations.of(context);

  /// Manual Added
  Locale language = CoreDefaults.defaultLanguage;
  String timeZoneAbbreviation = CoreDefaults.defaultCountry.timeZoneAbbreviation?.getMiddleElement() ?? '';
  bool isDst = CoreDefaults.defaultCountry.hasDst;

  // Data Getters
  AppSettingData _loadData() => loadAppData()?.settings ?? const AppSettingData();
  Locale getLocale() => _loadData().language.getLocale();
  TextDirection getTextDirection() =>
      supportedLocales.any((element) => element.languageCode == const Translation_fa().language.languageCode) ? TextDirection.rtl : TextDirection.ltr;

  // TimeZone & Country
  TimeZone getTimeZone() {
    DateTime currentTime = DateTime.now();
    TimeZone timeZone = TimeZone(
      currentTime.timeZoneOffset.inMilliseconds,
      abbreviation: currentTime.timeZoneName,
      isDst: currentTime.timeZoneName.contains('DT'),
    );
    return timeZone;
  }

  AppCountry getCountry() {
    var timeZone = getTimeZone().toDurationCustomModel();
    for (var c in AppCountry.values) {
      for (var tz in c.timeZoneOffset!) {
        if (tz == timeZone) return c;
      }
    }
    return AppCountry.us;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _supportedLocales.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
