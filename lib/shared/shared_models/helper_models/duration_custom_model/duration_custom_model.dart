import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/annotations/freezed_custom_annotation.dart';

part 'duration_custom_model.freezed.dart';
part 'duration_custom_model.g.dart';

@FreezedCustom.model
class DurationCustomModel with _$DurationCustomModel {
  const factory DurationCustomModel({
    @Default(0) int? year,
    @Default(0) int? month,
    @Default(0) int? week,
    @Default(0) int? day,
    @Default(0) int? hour,
    @Default(0) int? minute,
    @Default(0) int? second,
    @Default(0) int? milliSecond,
  }) = _DurationCustomModel;

  factory DurationCustomModel.fromJson(Map<String, dynamic> json) => _$DurationCustomModelFromJson(json);
}

@FreezedCustom.modelList
class DurationCustomModelsList with _$DurationCustomModelsList {
  factory DurationCustomModelsList({@Default(<DurationCustomModel>[]) List<DurationCustomModel> dataList}) = _DurationCustomModelsList;

  factory DurationCustomModelsList.fromJson(Map<String, dynamic> json) => _$DurationCustomModelsListFromJson(json);
}
