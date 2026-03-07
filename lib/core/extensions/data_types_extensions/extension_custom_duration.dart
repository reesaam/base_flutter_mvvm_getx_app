import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

extension ExtensionCustomDuration on DurationCustomModel {
  Duration toDuration() => Duration(days: day ?? 0, hours: hour ?? 0, minutes: minute ?? 0, seconds: second ?? 0, milliseconds: milliSecond ?? 0);

  String toFormattedOffset() => toDuration().toTimeZoneFormat();
}
