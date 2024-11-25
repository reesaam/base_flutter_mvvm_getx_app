import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/annotations/freezed_custom_annotation.dart';


part 'permission_base_response.freezed.dart';
part 'permission_base_response.g.dart';

@FreezedCustom.model
class PermissionBaseResponse with _$PermissionBaseResponse {
  const factory PermissionBaseResponse({
    final PermissionStatus? status,
    final String? permission,
  }) = _PermissionBaseResponse;

  factory PermissionBaseResponse.fromJson(Map<String, dynamic> json) => _$PermissionBaseResponseFromJson(json);
}
