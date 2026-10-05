import 'package:flutter_regex/flutter_regex.dart';

enum AppRegexes {
  numeric,
  url,
  phoneNumber,
  email(isExceptionOfFormatting: true),
  username,
  passwordEasy,
  passwordHard,
  macAddress,
  google(isExceptionOfFormatting: true),
  github(isExceptionOfFormatting: true),
  youTube(isExceptionOfFormatting: true),
  none;

  final bool? isExceptionOfFormatting;

  const AppRegexes({this.isExceptionOfFormatting});

  String value() => switch (this) {
    AppRegexes.numeric => r'^[0-9]+',
    AppRegexes.url => RegexPattern.url,
    AppRegexes.phoneNumber => RegexPattern.phone,
    AppRegexes.email => r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-zA-Z.]',
    AppRegexes.username => RegexPattern.username,
    AppRegexes.passwordEasy => RegexPattern.passwordEasy,
    AppRegexes.passwordHard => RegexPattern.passwordHard,
    AppRegexes.macAddress => RegexPattern.macAddress,
    AppRegexes.google => RegexPattern.usernameGoogle,
    AppRegexes.github => RegexPattern.github,
    AppRegexes.youTube => RegexPattern.youtube,
    _ => '',
  };
}
