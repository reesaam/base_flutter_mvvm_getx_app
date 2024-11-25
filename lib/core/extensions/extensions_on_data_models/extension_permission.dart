import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

extension ExtensionPermissionsName on Permission {
  String get getName => toString().split('.').last.capitalizeFirst ?? 'Unknown';
}

extension ExtensionPermissionsStatusName on PermissionStatus {
  String get getName => name.split('.').last.capitalizeFirst ?? 'Unknown';
}
