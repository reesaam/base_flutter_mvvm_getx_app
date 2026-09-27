import '../../barrels/localization_barrel.dart';

class GeneralException implements Exception {
  final String? message;
  final int? statusCode;
  StackTrace? stackTrace;

  GeneralException({this.message, this.statusCode, this.stackTrace});

  static GeneralException create({Object? ex}) =>
      GeneralException(message: (ex is GeneralException ? ex.message : ex?.toString()) ?? Texts.to.error.unknown, statusCode: 0);
}
