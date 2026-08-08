import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:base_flutter_mvvm_getx_app/app/di/binding_fixes.dart';
import 'package:base_flutter_mvvm_getx_app/components/secure_storage/secure_storage.dart';
import 'package:base_flutter_mvvm_getx_app/features/auth/data/auth_remote_data_source.dart';
import 'package:base_flutter_mvvm_getx_app/features/auth/data/auth_session.dart';
import 'package:base_flutter_mvvm_getx_app/features/update/data/update_remote_data_source.dart';
import 'package:base_flutter_mvvm_getx_app/features/versions/data/versions_local_data_source.dart';
import 'package:base_flutter_mvvm_getx_app/features/versions/data/versions_remote_data_source.dart';

void main() {
  setUp(() {
    Get.reset();
  });

  tearDown(() {
    Get.reset();
  });

  test('applyBindingFixes registers abstract DI types', () {
    applyBindingFixes();

    expect(Get.isRegistered<SecureStorageModule>(), isTrue);
    expect(Get.isRegistered<UpdateRemoteDataSource>(), isTrue);
    expect(Get.isRegistered<VersionsRemoteDataSource>(), isTrue);
    expect(Get.isRegistered<VersionsLocalDataSource>(), isTrue);
    expect(Get.isRegistered<AuthRemoteDataSource>(), isTrue);
    expect(Get.isRegistered<AuthSession>(), isTrue);
  });
}
