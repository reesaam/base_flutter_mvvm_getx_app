import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/annotations/freezed_custom_annotation.dart';


part 'push_notification_base_model.freezed.dart';
part 'push_notification_base_model.g.dart';

@FreezedCustom.model
class AppPushNotificationBaseModel with _$AppPushNotificationBaseModel {
  const factory AppPushNotificationBaseModel({
    final String? title,
  }) = _AppPushNotificationBaseModel;

  factory AppPushNotificationBaseModel.fromJson(Map<String, dynamic> json) => _$AppPushNotificationBaseModelFromJson(json);
}
