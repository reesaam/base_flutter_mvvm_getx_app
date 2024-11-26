import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../../../../core/core_functions.dart';
import '../../../core/app_localization.dart';
import '../../../core/core_resources/core_flags.dart';
import '../../../core/extensions/extension_for_prints/extension_for_prints.dart';
import '../../../ui_kit/theme/themes.dart';
import '../notifications_enums.dart';
import 'local_notification_controller.dart';

class AppLocalNotificationsRepository {
  String? channelName = 'channelName';
  String? channelDescription = 'channelDescription';
  String channelGroupKey = 'channelGroupKey';
  String channelGroupName = 'channelGroupName';

  List<NotificationChannel> _channels() {
    List<NotificationChannel> channels = [
      NotificationChannel(channelKey: AppNotificationChannelKey.simple.name, channelName: channelName, channelDescription: channelDescription)
    ];
    return channels;
  }

  List<NotificationChannelGroup>? _groups() {
    List<NotificationChannelGroup> groups = [
      NotificationChannelGroup(channelGroupKey: channelGroupKey, channelGroupName: channelGroupName),
    ];
    return groups;
  }

  Future<bool> init() async {
    bool initializationResult = await AwesomeNotifications().initialize(null, _channels(), channelGroups: _groups(), debug: !CoreFlags.isRelease);
    bool permissionResult = await _permissionCheck().withStatusPrint(featureName: 'App Local Notifications Permission Check');
    bool listenersInitResult = await _setListeners().withStatusPrint(featureName: 'App Local Notifications Listeners Set');
    bool channelSetResult = await _setChannel().withStatusPrint(featureName: 'App Local Notifications Channel Set');

    var receivedAction = await AwesomeNotifications().getInitialNotificationAction(removeFromActionEvents: false);
    appDebugPrint(receivedAction);

    return initializationResult && permissionResult && listenersInitResult && channelSetResult;
  }

  Future<bool> _setListeners() async {
    bool listenersInitResult = await AwesomeNotifications().setListeners(
      onActionReceivedMethod: (receivedAction) => AppLocalNotificationController.onActionReceivedMethod(receivedAction),
      onDismissActionReceivedMethod: (receivedAction) => AppLocalNotificationController.onDismissActionReceivedMethod(receivedAction),
      onNotificationCreatedMethod: (receivedNotification) => AppLocalNotificationController.onNotificationCreatedMethod(receivedNotification),
      onNotificationDisplayedMethod: (receivedNotification) => AppLocalNotificationController.onNotificationDisplayedMethod(receivedNotification),
    );

    return listenersInitResult;
  }

  Future<bool> _permissionCheck() async {
    bool permissionResult = await AwesomeNotifications().isNotificationAllowed();
    bool requestResult = await AwesomeNotifications().requestPermissionToSendNotifications();

    return permissionResult && requestResult;
  }

  Future<bool> _setChannel() async {
    if (_channels().isNotEmpty) {
      await AwesomeNotifications().setChannel(_channels().first);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createNotification({
    int? id,
    required AppNotificationChannelKey channelKey,
    //Main
    List<NotificationActionButton>? actionButtons,
    Map<String, NotificationLocalization>? localizations,
    // NotificationSchedule? schedule,
    NotificationInterval? interval,
    NotificationCalendar? calendar,
    //Content
    NotificationLayout? layout,
    Color? color,
    Color? backgroundColor,
    String? title,
    ActionType? actionType,
    bool? autoDismissible,
    int? badge,
    String? bigPicture,
    String? body,
    NotificationCategory? category,
    int? chronometerLongSeconds,
    bool? criticalAlert,
    String? customSound,
    bool? displayOnBackground,
    bool? displayOnForeground,
    bool? fullScreenIntent,
    String? groupKey,
    bool? hideLargeIconOnExpand,
    String? icon,
    String? largeIcon,
    bool? locked,
    Map<String, String?>? payload,
    double? progress,
    bool? roundedBigPicture,
    bool? roundedLargeIcon,
    bool? showWhen,
    String? summary,
    String? ticker,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
  }) async =>
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id ?? 1,
          channelKey: channelKey.name,
          notificationLayout: layout ?? NotificationLayout.Default,
          color: color,
          backgroundColor: backgroundColor,
          title: title,
          actionType: actionType ?? ActionType.Default,
          autoDismissible: autoDismissible ?? true,
          badge: badge ?? 0,
          bigPicture: bigPicture,
          body: body,
          category: category ?? NotificationCategory.Status,
          chronometer: Duration(seconds: chronometerLongSeconds ?? 0),
          criticalAlert: criticalAlert ?? false,
          customSound: customSound,
          displayOnBackground: displayOnBackground ?? true,
          displayOnForeground: displayOnForeground ?? true,
          fullScreenIntent: fullScreenIntent ?? false,
          groupKey: groupKey,
          hideLargeIconOnExpand: hideLargeIconOnExpand ?? true,
          icon: icon,
          largeIcon: largeIcon,
          locked: locked ?? false,
          payload: payload,
          progress: progress,
          roundedBigPicture: roundedBigPicture ?? false,
          roundedLargeIcon: roundedLargeIcon ?? false,
          showWhen: showWhen ?? false,
          summary: summary,
          ticker: ticker,
          timeoutAfter: Duration(seconds: timeoutAfterLongSeconds ?? 0),
          wakeUpScreen: wakeUpScreen ?? true,
        ),
        actionButtons: actionButtons,
        localizations: localizations,
        schedule: interval ?? calendar,
      );

  NotificationInterval createInterval({
    Duration? interval,
    bool? repeats,
    bool? preciseAlarm,
    bool? allowWhileIdle,
    String? timeZone,
  }) =>
      NotificationInterval(
          interval: interval ?? const Duration(seconds: 1),
          repeats: repeats ?? false,
          preciseAlarm: preciseAlarm ?? true,
          allowWhileIdle: allowWhileIdle ?? true,
          timeZone: timeZone);

  NotificationCalendar createCalendar(
          {DateTime? dateTime,
          String? timeZone,
          bool? allowWhileIdle,
          bool? preciseAlarm,
          bool? repeats,
          int? era,
          int? weekday,
          int? weekOfMonth,
          int? weekOfYear}) =>
      NotificationCalendar(
          timeZone: timeZone,
          allowWhileIdle: allowWhileIdle ?? true,
          preciseAlarm: preciseAlarm ?? true,
          repeats: repeats ?? false,
          hour: dateTime?.hour,
          second: dateTime?.second,
          minute: dateTime?.minute,
          day: dateTime?.day,
          month: dateTime?.month,
          year: dateTime?.year,
          era: era,
          millisecond: dateTime?.millisecond,
          weekday: dateTime?.weekday,
          weekOfMonth: weekOfMonth,
          weekOfYear: weekOfYear);

  NotificationActionButton createButton(
          {String? key,
          String? label,
          String? icon,
          bool? autoDismissible,
          ActionType? actionType,
          Color? color,
          bool? enabled,
          bool? isDangerousOption,
          bool? requireInputText,
          bool? showInCompactView}) =>
      NotificationActionButton(
          key: key ?? Texts.to.empty,
          label: label ?? Texts.to.empty,
          icon: icon,
          autoDismissible: autoDismissible ?? true,
          actionType: actionType ?? ActionType.Default,
          color: color ?? AppThemes.to.primaryColor,
          enabled: enabled ?? true,
          isDangerousOption: isDangerousOption ?? false,
          requireInputText: requireInputText ?? false,
          showInCompactView: showInCompactView ?? false);
}
