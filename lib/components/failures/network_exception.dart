import 'package:getx_binding_annotation/annotation.dart';
import 'package:dio/dio.dart' as dio;

import 'general_exception.dart';

@GetPut.component()
class NetworkException implements GeneralException {
  NetworkException({this.message, this.statusCode});

  @override
  final String? message;
  @override
  final int? statusCode;

  static NetworkException handleResponse(dio.Response? response) {
    switch (response?.statusCode) {
      case 203:
        return NonAuthoritativeInformationException();

      case 204:
        return NoContentException();

      case 304:
        return NotModifiedException();

      /// to call refresh_token
      case 401:
        return UnauthorizedException();

      case 402:
        return PaymentRequiredException();

      case 403:
        return ForbiddenException();

      case 404:
        return NotFoundException();

      case 405:
        return MethodNotAllowedException();

      case 406:
        return NotAcceptableException();

      case 407:
        return ProxyAuthRequiredException();

      case 408:
        return RequestTimeoutException();

      case 409:
        return ConflictException();

      case 411:
        return LengthRequiredException();

      case 412:
        return PreConditionFailedException();

      case 413:
        return RequestEntityTooLargeException();

      case 414:
        return RequestUriTooLongException();

      case 415:
        return UnsupportedMediaTypeException();

      case 416:
        return RequestedRangeNotSatisfiableException();

      case 417:
        return ExpectationFailedException();

      case 422:
        return UnProcessableEntityException();

      case 424:
        return FailedDependencyException();

      case 425:
        return UnorderedCollectionException();

      case 426:
        return UpgradeRequiredException();

      case 429:
        return TooManyRequestException();

      case 431:
        return RequestHeaderFieldsTooLargeException();

      case 444:
        return NoResponseException();

      case 451:
        return UnavailableForLegalReasonsException();

      case 494:
        return RequestHeaderTooLargeException();

      case 500:
        return InternalServerErrorException();

      case 501:
        return NotImplementedException();

      case 502:
        return BadGatewayException();

      case 503:
        return ServiceUnavailableException();

      case 504:
        return GatewayTimeoutException();

      case 507:
        return InsufficientStorageException();

      case 508:
        return LoopDetectedException();

      case 509:
        return BandwidthLimitException();

      case 510:
        return NotExtendedException();

      case 511:
        return NetworkAuthRequiredException();

      default:
        return UnknownException();
    }
  }

  static ParsingDataException parsingDataException() => ParsingDataException();
}

class ParsingDataException extends NetworkException {
  ParsingDataException() : super(message: 'Parsing Data Exception');
}

// 203
class NonAuthoritativeInformationException extends NetworkException {
  NonAuthoritativeInformationException() : super(message: 'NonAuthoritative Information Exception', statusCode: 203);
}

// 204
class NoContentException extends NetworkException {
  NoContentException() : super(message: 'No Content Exception', statusCode: 204);
}

// 304
class NotModifiedException extends NetworkException {
  NotModifiedException() : super(message: 'Not Modified Exception', statusCode: 304);
}

// 400
class BadRequestException extends NetworkException {
  BadRequestException() : super(message: 'Bad Request Exception', statusCode: 400);
}

// 401
/// to call refresh_token
class UnauthorizedException extends NetworkException {
  UnauthorizedException() : super(message: 'Unauthorized Exception', statusCode: 401);
}

// 402
class PaymentRequiredException extends NetworkException {
  PaymentRequiredException() : super(message: 'Payment Required Exception', statusCode: 402);
}

// 403
class ForbiddenException extends NetworkException {
  ForbiddenException() : super(message: 'Forbidden Exception', statusCode: 403);
}

// 404
class NotFoundException extends NetworkException {
  NotFoundException() : super(message: 'Not Found Exception', statusCode: 404);
}

// 405
class MethodNotAllowedException extends NetworkException {
  MethodNotAllowedException() : super(message: 'Method Not Allowed Exception', statusCode: 405);
}

// 406
class NotAcceptableException extends NetworkException {
  NotAcceptableException() : super(message: 'Not Acceptable Exception', statusCode: 406);
}

// 407
class ProxyAuthRequiredException extends NetworkException {
  ProxyAuthRequiredException() : super(message: 'Proxy Auth Required Exception', statusCode: 407);
}

// 408
class RequestTimeoutException extends NetworkException {
  RequestTimeoutException() : super(message: 'Request Timeout Exception', statusCode: 408);
}

// 409
class ConflictException extends NetworkException {
  ConflictException() : super(message: 'Conflict Exception', statusCode: 409);
}

// 411
class LengthRequiredException extends NetworkException {
  LengthRequiredException() : super(message: 'Length Required Exception', statusCode: 411);
}

// 412
class PreConditionFailedException extends NetworkException {
  PreConditionFailedException() : super(message: 'PreCondition Failed Exception', statusCode: 412);
}

// 413
class RequestEntityTooLargeException extends NetworkException {
  RequestEntityTooLargeException() : super(message: 'Request Entity Too Large Exception', statusCode: 413);
}

// 414
class RequestUriTooLongException extends NetworkException {
  RequestUriTooLongException() : super(message: 'Request Uri Too Long Exception', statusCode: 414);
}

// 415
class UnsupportedMediaTypeException extends NetworkException {
  UnsupportedMediaTypeException() : super(message: 'Unsupported Media Type Exception', statusCode: 415);
}

// 416
class RequestedRangeNotSatisfiableException extends NetworkException {
  RequestedRangeNotSatisfiableException() : super(message: 'Requested Range Not Satisfiable Exception', statusCode: 416);
}

// 417
class ExpectationFailedException extends NetworkException {
  ExpectationFailedException() : super(message: 'Expectation FailedException', statusCode: 417);
}

// 422
class UnProcessableEntityException extends NetworkException {
  UnProcessableEntityException() : super(message: 'UnProcessable Entity Exception', statusCode: 422);
}

// 424
class FailedDependencyException extends NetworkException {
  FailedDependencyException() : super(message: 'Failed Dependency Exception', statusCode: 424);
}

// 425
class UnorderedCollectionException extends NetworkException {
  UnorderedCollectionException() : super(message: 'Unordered Collection Exception', statusCode: 425);
}

// 426
class UpgradeRequiredException extends NetworkException {
  UpgradeRequiredException() : super(message: 'Upgrade Required Exception', statusCode: 426);
}

// 429
class TooManyRequestException extends NetworkException {
  TooManyRequestException() : super(message: 'Too Many Request Exception', statusCode: 429);
}

// 431
class RequestHeaderFieldsTooLargeException extends NetworkException {
  RequestHeaderFieldsTooLargeException() : super(message: 'Request Header Fields Too Large Exception', statusCode: 431);
}

// 444
class NoResponseException extends NetworkException {
  NoResponseException() : super(message: 'No Response Exception', statusCode: 444);
}

// 451
class UnavailableForLegalReasonsException extends NetworkException {
  UnavailableForLegalReasonsException() : super(message: 'Unavailable For Legal Reasons Exception', statusCode: 451);
}

// 494
class RequestHeaderTooLargeException extends NetworkException {
  RequestHeaderTooLargeException() : super(message: 'Request Header Too Large Exception', statusCode: 494);
}

// 500
class InternalServerErrorException extends NetworkException {
  InternalServerErrorException() : super(message: 'Internal Server Error Exception', statusCode: 500);
}

// 501
class NotImplementedException extends NetworkException {
  NotImplementedException() : super(message: 'Not Implemented Exception', statusCode: 501);
}

// 502
class BadGatewayException extends NetworkException {
  BadGatewayException() : super(message: 'Bad Gateway Exception', statusCode: 502);
}

// 503
class ServiceUnavailableException extends NetworkException {
  ServiceUnavailableException() : super(message: 'Service Unavailable Exception', statusCode: 503);
}

// 504
class GatewayTimeoutException extends NetworkException {
  GatewayTimeoutException() : super(message: 'Gateway Timeout Exception', statusCode: 504);
}

// 507
class InsufficientStorageException extends NetworkException {
  InsufficientStorageException() : super(message: 'Insufficient Storage Exception', statusCode: 507);
}

// 508
class LoopDetectedException extends NetworkException {
  LoopDetectedException() : super(message: 'Loop Detected Exception', statusCode: 508);
}

// 509
class BandwidthLimitException extends NetworkException {
  BandwidthLimitException() : super(message: 'Bandwidth Limit Exception', statusCode: 509);
}

// 510
class NotExtendedException extends NetworkException {
  NotExtendedException() : super(message: 'Not Extended Exception', statusCode: 510);
}

// 511
class NetworkAuthRequiredException extends NetworkException {
  NetworkAuthRequiredException() : super(message: 'Network AuthRequired Exception', statusCode: 511);
}

class UnknownException extends NetworkException {
  UnknownException() : super(message: 'Unknown Network Error');
}
