import 'dart:isolate';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';

import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';

import '../notifications_enums.dart';

@GetPut.component()
class AppLocalNotificationController extends CoreComponent {
  AppLocalNotificationController() {
    ReceivePort? receivePort;
    // IsolateNameServer.registerPortWithName(receivePort, AppNotificationsPortNames.receivePort.portName);
  }

  @pragma("vm:entry-point")
  static onActionReceivedMethod(ReceivedAction receivedAction) {
    appDebugPrint('Notification Received Action Channel Key: ${receivedAction.channelKey}');
    appDebugPrint('New Notification Action Received: ${receivedAction.toMap()}');

    SendPort? sendPort = IsolateNameServer.lookupPortByName(AppNotificationsPortNames.receivePort.portName);
    if (sendPort != null) {
      sendPort.send(receivedAction.toMap());
      return;
    }
  }

  @pragma("vm:entry-point")
  static onDismissActionReceivedMethod(ReceivedAction receivedAction) {
    appDebugPrint(receivedAction.channelKey);
  }

  @pragma("vm:entry-point")
  static onNotificationCreatedMethod(ReceivedNotification receivedNotification) {
    appDebugPrint(receivedNotification.channelKey);
  }

  @pragma("vm:entry-point")
  static onNotificationDisplayedMethod(ReceivedNotification receivedNotification) {
    appDebugPrint(receivedNotification.channelKey);
  }
}
