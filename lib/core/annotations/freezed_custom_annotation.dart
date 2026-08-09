import 'package:freezed_annotation/freezed_annotation.dart';
export 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class FreezedCustom {
  const FreezedCustom._();

  static const model = Freezed(toJson: true, fromJson: true);
  static const modelList = Freezed(toJson: true, fromJson: true, makeCollectionsUnmodifiable: false);

  static const enums = JsonEnum(alwaysCreate: true);
}
