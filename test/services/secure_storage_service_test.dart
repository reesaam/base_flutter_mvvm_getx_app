import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_elements_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_resources_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/services/secure_storage_service/secure_storage_service_abstraction.dart';

class _FakeSecureStorage extends CoreService implements SecureStorageService {
  final Map<AppStorageKeys, Object?> store = {};

  @override
  Future<BaseLocalResponse<T?>> read<T>(AppStorageKeys key) async => Right(store[key] as T?);

  @override
  Future<BaseLocalResponse<bool>> write<T>({required AppStorageKeys key, required T value}) async {
    store[key] = value;
    return const Right(true);
  }

  @override
  Future<BaseLocalResponse<bool>> remove(AppStorageKeys? key) async {
    if (key == null) {
      store.clear();
    } else {
      store.remove(key);
    }
    return const Right(true);
  }

  @override
  Future<BaseLocalResponse<bool>> hasData(AppStorageKeys key) async => Right(store.containsKey(key));
}

void main() {
  late _FakeSecureStorage secureStorage;

  setUp(() {
    Get.testMode = true;
    Get.reset();
    secureStorage = _FakeSecureStorage();
    Get.put<SecureStorageService>(secureStorage);
  });

  tearDown(Get.reset);

  test('SecureStorageService.to resolves the registered abstract', () {
    expect(SecureStorageService.to, same(secureStorage));
  });

  test('read, write, hasData and remove go through the abstract', () async {
    expect(await SecureStorageService.to.write(key: AppStorageKeys.accessToken, value: 'token'), const Right(true));
    expect(await SecureStorageService.to.hasData(AppStorageKeys.accessToken), const Right(true));
    expect(await SecureStorageService.to.read<String>(AppStorageKeys.accessToken), const Right('token'));
    expect(await SecureStorageService.to.remove(AppStorageKeys.accessToken), const Right(true));
    expect(await SecureStorageService.to.hasData(AppStorageKeys.accessToken), const Right(false));
  });
}
