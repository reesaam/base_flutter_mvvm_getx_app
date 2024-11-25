import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';
import 'package:timezone/timezone.dart';

import '../generated/l10n.dart';
import '../shared/shared_models/core_models/app_settings_data/app_setting_data.dart';
import 'core_functions.dart';
import 'core_info/core_defaults.dart';
import 'core_resources/countries.dart';
import 'core_resources/core_enums.dart';
import 'extensions/extensions_on_data_types/extension_languages.dart';
import 'extensions/extensions_on_data_types/extension_list.dart';
import 'extensions/extensions_on_data_types/extension_time_zone.dart';

class Texts {
  Texts._();
  static S get to => S.of(Get.context!);
}

@GetPut.component()
class AppLocalization {
  static AppLocalization get to => Get.find();

  get supportedLocales => S.delegate.supportedLocales;

  static List<Locale> get languagesList => [english, deutsch, persian];
  static Locale get english => Locale(AppLanguages.english.locale.languageCode, AppCountry.us.code);
  static Locale get deutsch => Locale(AppLanguages.deutsch.locale.languageCode, AppCountry.germany.code);
  static Locale get persian => Locale(AppLanguages.persian.locale.languageCode, AppCountry.iran.code);

  get localizationDelegates => [_delegate, _material, _widgets, _cupertino];
  AppLocalizationDelegate get _delegate => S.delegate;
  LocalizationsDelegate get _material => GlobalMaterialLocalizations.delegate;
  LocalizationsDelegate get _widgets => GlobalWidgetsLocalizations.delegate;
  LocalizationsDelegate get _cupertino => GlobalCupertinoLocalizations.delegate;

  ///Default Variables
  Locale language = CoreDefaults.defaultLanguage;
  String timeZoneAbbreviation = CoreDefaults.defaultCountry.timeZoneAbbreviation?.getMiddleElement() ?? '';
  bool isDst = CoreDefaults.defaultCountry.hasDst;

  Locale getLocale() => _loadData().language.getLocale();

  TextDirection getTextDirection() => _loadData().language.getLocale() == persian ? TextDirection.rtl : TextDirection.ltr;

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

AppSettingData _loadData() => loadAppData()?.settings ?? const AppSettingData();