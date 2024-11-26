import 'package:flutter_regex/flutter_regex.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/annotations/freezed_custom_annotation.dart';

part 'regex_model.freezed.dart';
part 'regex_model.g.dart';

@FreezedCustom.model
class AppRegexModel with _$AppRegexModel {
  const factory AppRegexModel({
    required final String regexValue,
    final bool? isExceptionOfFormatting,
  }) = _AppRegexModel;

  factory AppRegexModel.fromJson(Map<String, dynamic> json) => _$AppRegexModelFromJson(json);

  /// [AppRegexes] Different Types
  factory AppRegexModel.numeric() => const AppRegexModel(regexValue: r'^[0-9]+');
  factory AppRegexModel.url() => AppRegexModel(regexValue: RegexPattern.url);
  factory AppRegexModel.phoneNumber() => AppRegexModel(regexValue: RegexPattern.phone);
  factory AppRegexModel.email() => const AppRegexModel(regexValue: r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-zA-Z.]', isExceptionOfFormatting: true);
  factory AppRegexModel.username() => AppRegexModel(regexValue: RegexPattern.username);
  factory AppRegexModel.passwordEasy() => AppRegexModel(regexValue: RegexPattern.passwordEasy);
  factory AppRegexModel.passwordHard() => AppRegexModel(regexValue: RegexPattern.passwordHard);
  factory AppRegexModel.macAddress() => AppRegexModel(regexValue: RegexPattern.macAddress);
  factory AppRegexModel.google() => AppRegexModel(regexValue: RegexPattern.usernameGoogle, isExceptionOfFormatting: true);
  factory AppRegexModel.github() => AppRegexModel(regexValue: RegexPattern.github, isExceptionOfFormatting: true);
  factory AppRegexModel.youTube() => AppRegexModel(regexValue: RegexPattern.youtube, isExceptionOfFormatting: true);
}

@FreezedCustom.modelList
class AppRegexModelsList with _$AppRegexModelsList {
  factory AppRegexModelsList({@Default(<AppRegexModel>[]) List<AppRegexModel> regexesList}) = _AppRegexModelsList;

  factory AppRegexModelsList.fromJson(Map<String, dynamic> json) => _$AppRegexModelsListFromJson(json);

  factory AppRegexModelsList.all() => AppRegexModelsList(regexesList: List<AppRegexModel>.of([
    AppRegexModel.numeric(),
    AppRegexModel.url(),
    AppRegexModel.phoneNumber(),
    AppRegexModel.email(),
    AppRegexModel.username(),
    AppRegexModel.passwordEasy(),
    AppRegexModel.passwordHard(),
    AppRegexModel.macAddress(),
    AppRegexModel.google(),
    AppRegexModel.github(),
    AppRegexModel.youTube(),
  ]));

  factory AppRegexModelsList.exceptionsOfFormatting() =>
      AppRegexModelsList(regexesList: AppRegexModelsList.all().regexesList.where((element) => element.isExceptionOfFormatting == true).toList());
}
