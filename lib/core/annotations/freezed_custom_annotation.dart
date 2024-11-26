import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class FreezedCustom {
  const FreezedCustom();

  static const model = Freezed(toJson: true, fromJson: true);
  static const modelList = Freezed(toJson: true, fromJson: true, makeCollectionsUnmodifiable: false);

  static const enums = JsonEnum(alwaysCreate: true);
}