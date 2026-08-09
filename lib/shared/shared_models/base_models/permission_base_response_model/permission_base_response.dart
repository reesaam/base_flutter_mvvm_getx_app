import 'package:permission_handler/permission_handler.dart';

import '../../../../barrels/annotations_barrel.dart';

part 'permission_base_response.freezed.dart';
part 'permission_base_response.g.dart';

@FreezedCustom.model
abstract class PermissionBaseResponse with _$PermissionBaseResponse {
  const factory PermissionBaseResponse({final PermissionStatus? status, final String? permission}) = _PermissionBaseResponse;

  factory PermissionBaseResponse.fromJson(Map<String, dynamic> json) => _$PermissionBaseResponseFromJson(json);
}
