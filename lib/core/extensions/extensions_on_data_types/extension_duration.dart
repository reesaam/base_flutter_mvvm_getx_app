import '../../../shared/shared_models/helper_models/duration_custom_model/duration_custom_model.dart';
import '../../app_localization.dart';

extension ExtensionDateTimeDurationCalculation on Duration {
  DurationCustomModel calculateDifference() {
    var dDay = inDays;
    var dHour = inHours;
    var dMinute = inMinutes;
    var dSecond = inSeconds;

    var year = dDay > 365 ? (dDay / 365).floor() : 0;
    var month = ((dDay - (year * 365)) / 30).floor();
    var week = ((dDay - (year * 365) - (month * 30)) / 7).floor();
    var day = (dDay - (year * 365) - (month * 30) - (week * 7)).floor();
    var hour = dHour - (dDay * 24);
    var minute = dMinute - (dHour * 60);
    var second = dSecond - (dMinute * 60);

    return DurationCustomModel(year: year, month: month, week: week, day: day, hour: hour, minute: minute, second: second);
  }
}

extension ExtensionDateTimeDurationCalculationNull on Duration? {
  String toCompleteFormat() => this == null ? Texts.to.notAvailableInitials : this!.toCompleteFormat();
  String toConditionalFormat() => this == null ? Texts.to.notAvailableInitials : this!.toConditionalFormat();
}

extension ExtensionDateTimeFormat on Duration {
  String toCompleteFormat() {
    DurationCustomModel diff = calculateDifference();
    return '${diff.year}Y, ${diff.month}M, ${diff.week}W, ${diff.day}D, ${diff.hour}H, ${diff.minute}M, ${diff.second}S';
  }

  String toConditionalFormat() {
    DurationCustomModel diff = calculateDifference();
    List<String> list = List<String>.empty(growable: true);
    diff.year == 0 || diff.year == null ? null : list.add('${diff.year}Y,');
    diff.month == 0 || diff.month == null ? null : list.add(' ${diff.month}M,');
    diff.week == 0 || diff.week == null ? null : list.add(' ${diff.week}W,');
    diff.day == 0 || diff.day == null ? null : list.add(' ${diff.day}D,');
    diff.hour == 0 || diff.hour == null ? null : list.add(' ${diff.hour}H,');
    diff.minute == 0 || diff.minute == null ? null : list.add(' ${diff.minute}M,');
    diff.second == 0 || diff.second == null ? null : list.add(' ${diff.second}S,');
    String result = Texts.to.empty;
    for (var s in list) {
      if (s.isNotEmpty) result = result + s;
    }
    result.isNotEmpty ? result = result.replaceRange(result.length - 1, result.length, Texts.to.empty) : null;
    return result.isEmpty ? Texts.to.notAvailableInitials : result;
  }

  String toTimeZoneFormat() {
    DurationCustomModel diff = calculateDifference();
    var sign = diff.hour! < 0 ? '-' : '+';
    return '$sign${diff.hour?.abs().toString().padLeft(2, '0')}:${diff.minute.toString().padLeft(2, '0')}';
  }
}
