import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';
import 'package:timezone/timezone.dart';

import '../core/core_resources/countries.dart';
import '../core/extensions/extensions_on_data_types/extension_time_zone.dart';

//Languages Import
import 'translation.i69n.dart';
import 'translation_fa.i69n.dart';

const _supportedLocales = ['en', 'fa'];

class Texts {
  Texts._();
  static Translation get to => AppLocalizations.of(Get.context!);
}

@GetPut.component()
class AppLocalizations {
  AppLocalizations({this.translation});
  static AppLocalizations get to => Get.find();

  final Translation? translation;

  static final _translations = <String, Translation Function()>{
    'en': () => const Translation(),
    'fa': () => const Translation_fa(),
  };

  get localizationDelegates => [_delegate, _material, _widgets, _cupertino];
  LocalizationsDelegate get _delegate => const _AppLocalizationsDelegate();
  LocalizationsDelegate get _material => GlobalMaterialLocalizations.delegate;
  LocalizationsDelegate get _widgets => GlobalWidgetsLocalizations.delegate;
  LocalizationsDelegate get _cupertino => GlobalCupertinoLocalizations.delegate;

  static List<Locale> get supportedLocales => _supportedLocales.map((x) => Locale(x)).toList();

  static Future<AppLocalizations> load(Locale locale) => Future.value(AppLocalizations(translation: _translations[locale.languageCode]!()));

  static Translation of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations)!.translation!;

  /// Manual Added
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
