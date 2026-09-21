enum AppNotificationChannelKey {
  simple, //Default
  scheduled,
}

enum AppNotificationsPortNames {
  receivePort('app_notifications_receive_port'),
  sendPort('app_notifications_send_port');

  final String portName;
  const AppNotificationsPortNames(this.portName);
}
