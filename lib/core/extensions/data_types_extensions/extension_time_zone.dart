import 'package:timezone/timezone.dart';

import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

import 'extension_custom_duration.dart';
import 'extension_duration.dart';

extension ExtensionTimeZone on TimeZone {
  String get countryName {
    String result = Texts.to.general.notAvailableInitials;
    for (var country in AppCountry.values) {
      for (var abbr in country.timeZoneAbbreviation!) {
        if (abbr == abbreviation) {
          result = country.countryName ?? Texts.to.general.notAvailableInitials;
        }
      }
    }
    return result;
  }

  DurationCustomModel toDurationCustomModel() => Duration(milliseconds: offset.inMicroseconds).calculateDifference();

  String toFormattedOffset() => toDurationCustomModel().toDuration().toTimeZoneFormat();
}
