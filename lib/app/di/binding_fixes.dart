import 'package:get/get.dart';

import '../../components/secure_storage/secure_storage.dart';
import '../../features/auth/data/auth_remote_data_source.dart';
import '../../features/auth/data/auth_session.dart';
import '../../features/update/data/update_remote_data_source.dart';
import '../../features/versions/data/versions_local_data_source.dart';
import '../../features/versions/data/versions_remote_data_source.dart';

/// Ensures abstract DI types are registered even if codegen emits Impl types.
///
/// Call after [GetPutBindings.dependencies]. Safe to re-run.
void applyBindingFixes() {
  _ensure<SecureStorageModule>(() => SecureStorageModuleImpl());
  _ensure<UpdateRemoteDataSource>(() => UpdateRemoteDataSourceImpl());
  _ensure<VersionsRemoteDataSource>(() => VersionsRemoteDataSourceImpl());
  _ensure<VersionsLocalDataSource>(() => VersionsLocalDataSourceImpl());
  _ensure<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  _ensure<AuthSession>(() => AuthSession());
}

void _ensure<T extends Object>(T Function() factory, {bool fenix = true}) {
  if (Get.isRegistered<T>()) return;
  Get.lazyPut<T>(factory, fenix: fenix);
}
