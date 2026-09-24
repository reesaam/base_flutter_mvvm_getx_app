import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_resources_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/shared_models_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/services/statistics_service.dart';
import 'package:base_flutter_mvvm_getx_app/services/storage_service/app_storage_service.dart';
import 'package:base_flutter_mvvm_getx_app/services/storage_service/app_storage_service_abstraction.dart';

class _MockStorageEngine extends Mock implements AppStoragesAbstraction {}

void main() {
  late _MockStorageEngine engine;

  setUpAll(() {
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    Get.testMode = true;
    Get.reset();
    engine = _MockStorageEngine();
    Get.put(AppStorageService(storage: engine));
    Get.put(AppStatisticsService());
  });

  tearDown(Get.reset);

  test('increaseLaunch increments launches on stored statistics', () async {
    when(() => engine.loadData(any())).thenAnswer((_) async => const Right({'statisticsData': {'launches': 2, 'logins': 1}}));
    when(() => engine.saveData(key: any(named: 'key'), data: any(named: 'data'))).thenAnswer((_) async => const Right(true));

    AppStatisticsService.to.increaseLaunch();
    await untilCalled(() => engine.saveData(key: any(named: 'key'), data: any(named: 'data')));

    final saved = verify(() => engine.saveData(key: AppStorageKeys.appData.name, data: captureAny(named: 'data'))).captured.single as Map<String, dynamic>;
    expect((saved['statisticsData'] as AppStatisticsData).launches, 3);
    expect((saved['statisticsData'] as AppStatisticsData).logins, 1);
  });

  test('increaseLaunch does not save when statisticsData is missing', () async {
    when(() => engine.loadData(any())).thenAnswer((_) async => const Right(<String, dynamic>{}));

    AppStatisticsService.to.increaseLaunch();
    await Future<void>.delayed(const Duration(milliseconds: 20));

    verifyNever(() => engine.saveData(key: any(named: 'key'), data: any(named: 'data')));
  });
}
