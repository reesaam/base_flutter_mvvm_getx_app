import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:base_flutter_mvvm_getx_app/services/connectivity_service.dart';

class _MockInternetConnection extends Mock implements InternetConnection {}

class _MockConnectivity extends Mock implements Connectivity {}

void main() {
  late _MockInternetConnection internet;
  late _MockConnectivity connectivity;
  late AppConnectionService service;

  setUp(() {
    Get.testMode = true;
    Get.reset();
    internet = _MockInternetConnection();
    connectivity = _MockConnectivity();
    when(() => internet.onStatusChange).thenAnswer((_) => const Stream<InternetStatus>.empty());
    when(() => connectivity.onConnectivityChanged).thenAnswer((_) => const Stream<List<ConnectivityResult>>.empty());
    when(() => internet.internetStatus).thenAnswer((_) async => InternetStatus.connected);
    when(() => internet.hasInternetAccess).thenAnswer((_) async => true);
    when(() => connectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.wifi]);
    service = AppConnectionService(internetConnection: internet, connectivity: connectivity);
    Get.put(service);
  });

  tearDown(Get.reset);

  test('AppConnectionService.to resolves the registered service', () {
    expect(AppConnectionService.to, same(service));
  });

  test('checkInternet, checkInternetStatus and checkConnection use injected engines', () async {
    expect(await service.checkInternet(), isTrue);
    expect(await service.checkInternetStatus(), InternetStatus.connected);
    expect(await service.checkConnection(), [ConnectivityResult.wifi]);
  });

  test('onCloseFunction cancels listeners without throwing', () {
    expect(service.onCloseFunction, returnsNormally);
  });
}
