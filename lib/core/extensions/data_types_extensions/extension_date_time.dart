import '../../../barrels/localization_barrel.dart';

extension ExtensionDateTimeStringProvidersNull on DateTime? {
  String toDateTimeFormat({String? separator}) => this == null ? Texts.to.general.empty : this!.toDateTimeFormat();
  String toDateFormat({String? separator}) => this == null ? Texts.to.general.empty : this!.toDateFormat();
  String toTimeFormat({bool? withSeconds}) => this == null ? Texts.to.general.empty : this!.toTimeFormat();
}

extension ExtensionDateTimeStringProviders on DateTime {
  String toDateTimeFormat({String? separator, bool? withTimeOfDay}) {
    String sp = separator ?? '/';
    return '${year.toString().padLeft(4, '0')}$sp${month.toString().padLeft(2, '0')}$sp${day.toString().padLeft(2, '0')} - ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}${withTimeOfDay == true ? '  ${timeOfDay()}' : ''}';
  }

  String toDateFormat({String? separator}) {
    String sp = separator ?? '/';
    return '${year.toString().padLeft(4, '0')}$sp${month.toString().padLeft(2, '0')}$sp${day.toString().padLeft(2, '0')}';
  }

  String toTimeFormat({bool? withSeconds, bool? withTimeOfDay}) =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}${withSeconds == true ? ':${second.toString().padLeft(2, '0')}' : ''}${withTimeOfDay == true ? '  ${timeOfDay()}' : ''}';

  String timeOfDay() => hour >= 12 ? Texts.to.general.timeOfDayPM : Texts.to.general.timeOfDayAM;

}

extension ExtensionDateTimeCompareNull on DateTime? {
  bool equalTo(DateTime? dateTime) => this == null && dateTime == null
      ? true
      : this == null || dateTime == null
      ? false
      : this!.equalTo(dateTime);
}

extension ExtensionDateTimeCompare on DateTime {
  bool equalTo(DateTime? dateTime) => dateTime == null ? false : toDateTimeFormat == dateTime.toDateTimeFormat;
}
