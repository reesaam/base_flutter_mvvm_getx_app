class GeneralException implements Exception {
  final String? message;
  final int? statusCode;
  GeneralException({this.message, this.statusCode});

  static GeneralException create(ex) => GeneralException(message: ex?.toString() ?? 'Unknown Exception', statusCode: 0);
}
