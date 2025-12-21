// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'translation.i69n.dart';

String get _languageCode => 'fa';
String get _localeName => 'fa';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Translation_fa extends Translation {
  const Translation_fa();
  LanguageTranslation_fa get language => LanguageTranslation_fa(this);
  AppTranslation_fa get app => AppTranslation_fa(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'language':
        return language;
      case 'app':
        return app;
      default:
        return super[key];
    }
  }
}

class LanguageTranslation_fa extends LanguageTranslation {
  final Translation_fa _parent;
  const LanguageTranslation_fa(this._parent) : super(_parent);
  String get languageName => "Persian";
  String get languageCode => "fa";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'languageName':
        return languageName;
      case 'languageCode':
        return languageCode;
      default:
        return super[key];
    }
  }
}

class AppTranslation_fa extends AppTranslation {
  final Translation_fa _parent;
  const AppTranslation_fa(this._parent) : super(_parent);
  String get appName => "Base Flutter MVVM GetX App";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'appName':
        return appName;
      default:
        return super[key];
    }
  }
}
