import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../app_localization.dart';


extension ExtensionJalaliStringProvidersNull on Jalali? {
  String toDateTimeFormat() => this == null ? Texts.to.empty : this!.toDateTimeFormat();
  String toDateFormat() => this == null ? Texts.to.empty : this!.toDateFormat();
  String toTimeFormat() => this == null ? Texts.to.empty : this!.toTimeFormat();
  String toTimeFormatWithSeconds() => this == null ? Texts.to.empty : this!.toTimeFormatWithSeconds();
}

extension ExtensionJalaliStringProvider on Jalali {
  String toDateTimeFormat() =>
      '${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')} - ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String toDateFormat() => '${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';
  String toTimeFormat() => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String toTimeFormatWithSeconds() => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
}
