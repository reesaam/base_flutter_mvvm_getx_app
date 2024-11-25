import 'package:flutter/material.dart';

enum AppDataVersions {
  v1(1);

  final int number;
  const AppDataVersions(this.number);
}

enum AppStorageProvider {
  getStorage,
  sharedPreferences,
}

enum AppVersionTypes {
  release,
  beta,
  hidden,
}

enum APIVersions {
  v1;

  String get getValue => name;
}

enum APISections {
  versions,
  update;

  String get getName => name;
}

enum AppLanguages {
  english('English', Locale('en')),
  deutsch('Deutsch', Locale('de')),
  persian('Persian', Locale('fa'));

  final String languageName;
  final Locale locale;
  const AppLanguages(this.languageName, this.locale);
}

enum AppStorageKeys {
  keyAppData,
}
