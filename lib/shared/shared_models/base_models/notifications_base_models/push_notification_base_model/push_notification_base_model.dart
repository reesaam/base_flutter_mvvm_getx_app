import '../../../../../barrels/annotations_barrel.dart';

part 'push_notification_base_model.freezed.dart';
part 'push_notification_base_model.g.dart';

@FreezedCustom.model
abstract class AppPushNotificationBaseModel with _$AppPushNotificationBaseModel {
  const factory AppPushNotificationBaseModel({final String? title}) = _AppPushNotificationBaseModel;

  factory AppPushNotificationBaseModel.fromJson(Map<String, dynamic> json) => _$AppPushNotificationBaseModelFromJson(json);
}
