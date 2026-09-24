import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_elements_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/services/notifications_service/notifications_repository.dart';

class _MockNotifications extends Mock implements AppNotificationsRepository {}

class _FakeNotifications extends CoreRepository implements AppNotificationsRepository {
  @override
  Future<bool> init() async => true;

  @override
  Future<bool> simple({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
  }) async => true;

  @override
  Future<bool> scheduled({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
    required DateTime dateTime,
  }) async => true;

  @override
  Future<bool> intervalBased({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
    required Duration interval,
    bool? repeat,
    bool? preciseAlarm,
  }) async => true;
}

void main() {
  setUp(() {
    Get.testMode = true;
    Get.reset();
  });

  tearDown(Get.reset);

  test('Get.find resolves AppNotificationsRepository', () {
    final notifications = _FakeNotifications();
    Get.put<AppNotificationsRepository>(notifications);
    expect(Get.find<AppNotificationsRepository>(), same(notifications));
  });

  test('AppNotificationsRepository can be mocked with mocktail', () async {
    final notifications = _MockNotifications();
    when(() => notifications.init()).thenAnswer((_) async => true);
    when(() => notifications.simple(title: 'Hello', body: 'World')).thenAnswer((_) async => true);

    expect(await notifications.init(), isTrue);
    expect(await notifications.simple(title: 'Hello', body: 'World'), isTrue);
    verify(() => notifications.init()).called(1);
  });
}
