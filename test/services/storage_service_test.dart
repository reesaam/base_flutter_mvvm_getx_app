import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_resources_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/shared_models_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/services/storage_service/app_storage_service.dart';
import 'package:base_flutter_mvvm_getx_app/services/storage_service/app_storage_service_abstraction.dart';

class _MockStorageEngine extends Mock implements AppStoragesAbstraction {}

void main() {
  late _MockStorageEngine engine;
  late AppStorageService service;

  setUpAll(() {
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    engine = _MockStorageEngine();
    service = AppStorageService(storage: engine);
  });

  test('saveAppData writes AppData json on the engine', () async {
    const appData = AppData(dataVersion: AppDataVersions.v1);
    when(() => engine.saveData(key: any(named: 'key'), data: any(named: 'data'))).thenAnswer((_) async => const Right(true));

    final result = await service.saveAppData(appData: appData);

    expect(result, const Right(true));
    verify(() => engine.saveData(key: AppStorageKeys.appData.name, data: appData.toJson())).called(1);
  });

  test('loadAppData maps engine json to AppData', () async {
    when(() => engine.loadData(any())).thenAnswer((_) async => const Right({'statisticsData': {'launches': 3}}));

    final result = await service.loadAppData();

    result.fold((_) => fail('expected Right'), (data) => expect(data?.statisticsData?.launches, 3));
    verify(() => engine.loadData(AppStorageKeys.appData.name)).called(1);
  });

  test('loadAppData returns Right(null) when engine has no data', () async {
    when(() => engine.loadData(any())).thenAnswer((_) async => const Right(null));

    final result = await service.loadAppData();

    result.fold((_) => fail('expected Right'), (data) => expect(data, isNull));
  });

  test('clearStorage and clearAppData use the appData key', () async {
    when(() => engine.clear(any())).thenAnswer((_) async => const Right(true));

    expect(await service.clearStorage(), const Right(true));
    expect(await service.clearAppData(), const Right(true));
    verify(() => engine.clear(AppStorageKeys.appData.name)).called(2);
  });
}
