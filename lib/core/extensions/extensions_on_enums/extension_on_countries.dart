import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

import '../../core_resources/countries.dart';
import '../../../ui_kit/resources/elements.dart';

extension ExtensionCountriesList on List<AppCountry> {
  List<AppCountry> get getSortedCountriesList {
    List<AppCountry> countries = List<AppCountry>.generate(AppCountry.values.length, (index) => AppCountry.values[index]);
    countries.sort((a, b) => a.countryName!.compareTo(b.countryName!));
    countries.removeWhere((element) => element == AppCountry.utc);
    countries.insert(0, AppCountry.utc);
    countries.removeWhere((element) => element == AppCountry.unknown);
    return countries;
  }
}

extension ExtensionCountryFlagWidget on AppCountry {
  Widget flag({
    double? size,
    bool? rounded,
    double? roundRadius,
    bool? hasBorder,
    Color? borderColor,
    double? padding,
    double? aspectRatio,
  }) {
    return Container(
        width: size ?? 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(rounded == true ? roundRadius ?? AppElements.defaultRadius : 0)),
          border: hasBorder == true ? Border.all(color: borderColor ?? Colors.black45) : null,
        ),
        padding: EdgeInsets.all(padding ?? 0),
        child: AspectRatio(
            aspectRatio: aspectRatio ?? 1.5,
            child: CountryFlag.fromCountryCode(
              countryNameAbbreviation ?? '',
              shape: RoundedRectangle(rounded == true ? roundRadius ?? AppElements.defaultRadius : 0),
            )));
  }
}
