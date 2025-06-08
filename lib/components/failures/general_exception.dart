import 'package:getx_binding_annotation/get_put_annotation.dart';

@GetPut.component()
class GeneralException implements Exception {
  final String? message;
  final int? statusCode;
  GeneralException({this.message, this.statusCode});
}
