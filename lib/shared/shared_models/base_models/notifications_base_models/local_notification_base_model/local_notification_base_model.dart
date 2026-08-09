import '../../../../../barrels/annotations_barrel.dart';

part 'local_notification_base_model.freezed.dart';
part 'local_notification_base_model.g.dart';

@FreezedCustom.model
abstract class AppLocalNotificationBaseModel with _$AppLocalNotificationBaseModel {
  const factory AppLocalNotificationBaseModel({final String? title}) = _AppLocalNotificationBaseModel;

  factory AppLocalNotificationBaseModel.fromJson(Map<String, dynamic> json) => _$AppLocalNotificationBaseModelFromJson(json);
}
