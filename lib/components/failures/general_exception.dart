import 'package:injectable/injectable.dart';

@injectable
class GeneralException implements Exception {
  final String? message;
  final int? statusCode;
  GeneralException({this.message, this.statusCode});
}
