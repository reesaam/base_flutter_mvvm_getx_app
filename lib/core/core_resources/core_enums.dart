import '../../barrels/core_barrel.dart';

enum AppDataVersions {
  v1;

  String get number => name.replaceRange(0, 1, '');
}

enum AppStorageProvider {
  getStorage,
  sharedPreferences,
}

enum Environment {
  development(baseUrl: 'resam.site', subDomain: 'www'),
  stage(baseUrl: 'resam.site', subDomain: 'stage'),
  production(baseUrl: 'resam.site', subDomain: 'www');

  final String baseUrl;
  final String? subDomain;
  const Environment({required this.baseUrl, this.subDomain});
}

enum AppVersionTypes {
  release,
  beta,
  hidden,
}

enum APIVersions {
  v1;

  String get getValue => name.replaceRange(0, 1, '');
}

enum APISections {
  versions,
  update,
  auth;

  String get getName => name;
}

enum AppLanguages {
  english('English', Locale('en'), TextDirection.ltr),
  deutsch('Deutsch', Locale('de'), TextDirection.ltr),
  persian('Persian', Locale('fa'), TextDirection.rtl);

  final String languageName;
  final Locale locale;
  final TextDirection textDirection;
  const AppLanguages(this.languageName, this.locale, this.textDirection);
}

enum AppStorageKeys {
  appSecureStorage,
  appData,
  deepLink,
  accessToken,
  refreshToken,
  authUser,
}
