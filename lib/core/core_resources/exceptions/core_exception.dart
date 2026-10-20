import '../../../barrels/localization_barrel.dart';

class CoreException implements Exception {
  final String? message;
  final int? statusCode;
  StackTrace? stackTrace;

  CoreException({this.message, this.statusCode, this.stackTrace});

  static CoreException create({Object? ex}) =>
      CoreException(message: (ex is CoreException ? ex.message : ex?.toString()) ?? Texts.to.error.unknown, statusCode: 0);
}
