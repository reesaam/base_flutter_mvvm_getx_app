import 'dart:isolate';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';

import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/services_barrel.dart';
import '../notifications_enums.dart';

@GetPut.service()
class AppLocalNotificationService extends CoreService {
  AppLocalNotificationService() {
    ReceivePort? receivePort;
    // IsolateNameServer.registerPortWithName(receivePort, AppNotificationsPortNames.receivePort.portName);
  }

  static AppLocalNotificationService get to => Get.find();

  @notificationAnnotation
  static onActionReceivedMethod(ReceivedAction receivedAction) {
    loggerService.devLog(message: 'Notification Received Action Channel Key: ${receivedAction.channelKey}');
    loggerService.devLog(message: 'New Notification Action Received: ${receivedAction.toMap()}');

    SendPort? sendPort = IsolateNameServer.lookupPortByName(AppNotificationsPortNames.receivePort.portName);
    if (sendPort != null) {
      sendPort.send(receivedAction.toMap());
      return;
    }
  }

  @notificationAnnotation
  static onDismissActionReceivedMethod(ReceivedAction receivedAction) {
    loggerService.devLog(message: receivedAction.channelKey.toString());
  }

  @notificationAnnotation
  static onNotificationCreatedMethod(ReceivedNotification receivedNotification) {
    loggerService.devLog(message: receivedNotification.channelKey.toString());
  }

  @notificationAnnotation
  static onNotificationDisplayedMethod(ReceivedNotification receivedNotification) {
    loggerService.devLog(message: receivedNotification.channelKey.toString());
  }
}
