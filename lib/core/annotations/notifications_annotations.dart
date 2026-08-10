import '../../barrels/annotations_barrel.dart';

@immutable
class NotificationAnnotation {
  const NotificationAnnotation();

  static const entryPoint = pragma('vm:entry-point');
}

const notificationAnnotation = NotificationAnnotation.entryPoint;
