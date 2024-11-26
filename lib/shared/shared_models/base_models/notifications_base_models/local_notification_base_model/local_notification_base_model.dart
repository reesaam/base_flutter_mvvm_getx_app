import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/annotations/freezed_custom_annotation.dart';


part 'local_notification_base_model.freezed.dart';
part 'local_notification_base_model.g.dart';

@FreezedCustom.model
class AppLocalNotificationBaseModel with _$AppLocalNotificationBaseModel {
  const factory AppLocalNotificationBaseModel({
    final String? title,
  }) = _AppLocalNotificationBaseModel;

  factory AppLocalNotificationBaseModel.fromJson(Map<String, dynamic> json) => _$AppLocalNotificationBaseModelFromJson(json);
}
