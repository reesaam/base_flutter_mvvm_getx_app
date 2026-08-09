import '../barrels/annotations_barrel.dart';
import '../barrels/core_barrel.dart';
import '../barrels/core_resources_barrel.dart';
import '../barrels/extensions_barrel.dart';
import '../barrels/localization_barrel.dart';

const _supportedLocales = ['en', 'fa'];

class Texts {
  Texts._();
  static Translation get to => AppLocalizations.to.of(Get.context!);
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

  List<Locale> get supportedLocales => _supportedLocales.map((x) => Locale(x)).toList();

  Future<AppLocalizations> load(Locale locale) =>
      Future.value(AppLocalizations(translation: _translations[locale.languageCode]!()));

  Translation of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!.translation!;

  /// Manual Added
  // TimeZone & Country
  TimeZone getTimeZone() {
    DateTime currentTime = DateTime.now();
    TimeZone timeZone = TimeZone(
      currentTime.timeZoneOffset,
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
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.to.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
