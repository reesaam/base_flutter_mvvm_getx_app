import '../../localization/localizations.dart';
import 'network_exception.dart';

enum NetworkExceptions {
  nonAuthoritativeInformationException(statusCode: 203),
  noContentException(statusCode: 204),
  notModifiedException(statusCode: 304),
  unauthorizedException(statusCode: 401),
  paymentRequiredException(statusCode: 402),
  forbiddenException(statusCode: 403),
  notFoundException(statusCode: 404),
  methodNotAllowedException(statusCode: 405),
  notAcceptableException(statusCode: 406),
  proxyAuthRequiredException(statusCode: 407),
  requestTimeoutException(statusCode: 408),
  conflictException(statusCode: 409),
  lengthRequiredException(statusCode: 411),
  preConditionFailedException(statusCode: 412),
  requestEntityTooLargeException(statusCode: 413),
  requestUriTooLongException(statusCode: 414),
  unsupportedMediaTypeException(statusCode: 415),
  requestedRangeNotSatisfiableException(statusCode: 416),
  expectationFailedException(statusCode: 417),
  unProcessableEntityException(statusCode: 422),
  failedDependencyException(statusCode: 424),
  unorderedCollectionException(statusCode: 425),
  upgradeRequiredException(statusCode: 426),
  tooManyRequestException(statusCode: 429),
  requestHeaderFieldsTooLargeException(statusCode: 431),
  noResponseException(statusCode: 444),
  unavailableForLegalReasonsException(statusCode: 451),
  requestHeaderTooLargeException(statusCode: 494),
  internalServerErrorException(statusCode: 500),
  notImplementedException(statusCode: 501),
  badGatewayException(statusCode: 502),
  serviceUnavailableException(statusCode: 503),
  gatewayTimeoutException(statusCode: 504),
  insufficientStorageException(statusCode: 507),
  loopDetectedException(statusCode: 508),
  bandwidthLimitException(statusCode: 509),
  notExtendedException(statusCode: 510),
  networkAuthRequiredException(statusCode: 511),
  unknownException(statusCode: null);

  final int? statusCode;
  const NetworkExceptions({required this.statusCode});
}

extension NetworkExceptionsExtension on NetworkExceptions {
  NetworkException get exception => NetworkException(statusCode: statusCode, message: message);

  String get message => switch (this) {
        NetworkExceptions.nonAuthoritativeInformationException => Texts.to.error.network.nonAuthoritativeInformationException,
        NetworkExceptions.noContentException => Texts.to.error.network.noContentException,
        NetworkExceptions.notModifiedException => Texts.to.error.network.notModifiedException,
        NetworkExceptions.unauthorizedException => Texts.to.error.network.unauthorizedException,
        NetworkExceptions.paymentRequiredException => Texts.to.error.network.paymentRequiredException,
        NetworkExceptions.forbiddenException => Texts.to.error.network.forbiddenException,
        NetworkExceptions.notFoundException => Texts.to.error.network.notFoundException,
        NetworkExceptions.methodNotAllowedException => Texts.to.error.network.methodNotAllowedException,
        NetworkExceptions.notAcceptableException => Texts.to.error.network.notAcceptableException,
        NetworkExceptions.proxyAuthRequiredException => Texts.to.error.network.proxyAuthRequiredException,
        NetworkExceptions.requestTimeoutException => Texts.to.error.network.requestTimeoutException,
        NetworkExceptions.conflictException => Texts.to.error.network.conflictException,
        NetworkExceptions.lengthRequiredException => Texts.to.error.network.lengthRequiredException,
        NetworkExceptions.preConditionFailedException => Texts.to.error.network.preConditionFailedException,
        NetworkExceptions.requestEntityTooLargeException => Texts.to.error.network.requestEntityTooLargeException,
        NetworkExceptions.requestUriTooLongException => Texts.to.error.network.requestUriTooLongException,
        NetworkExceptions.unsupportedMediaTypeException => Texts.to.error.network.unsupportedMediaTypeException,
        NetworkExceptions.requestedRangeNotSatisfiableException => Texts.to.error.network.requestedRangeNotSatisfiableException,
        NetworkExceptions.expectationFailedException => Texts.to.error.network.expectationFailedException,
        NetworkExceptions.unProcessableEntityException => Texts.to.error.network.unProcessableEntityException,
        NetworkExceptions.failedDependencyException => Texts.to.error.network.failedDependencyException,
        NetworkExceptions.unorderedCollectionException => Texts.to.error.network.unorderedCollectionException,
        NetworkExceptions.upgradeRequiredException => Texts.to.error.network.upgradeRequiredException,
        NetworkExceptions.tooManyRequestException => Texts.to.error.network.tooManyRequestException,
        NetworkExceptions.requestHeaderFieldsTooLargeException => Texts.to.error.network.requestHeaderFieldsTooLargeException,
        NetworkExceptions.noResponseException => Texts.to.error.network.noResponseException,
        NetworkExceptions.unavailableForLegalReasonsException => Texts.to.error.network.unavailableForLegalReasonsException,
        NetworkExceptions.requestHeaderTooLargeException => Texts.to.error.network.requestHeaderTooLargeException,
        NetworkExceptions.internalServerErrorException => Texts.to.error.network.internalServerErrorException,
        NetworkExceptions.notImplementedException => Texts.to.error.network.notImplementedException,
        NetworkExceptions.badGatewayException => Texts.to.error.network.badGatewayException,
        NetworkExceptions.serviceUnavailableException => Texts.to.error.network.serviceUnavailableException,
        NetworkExceptions.gatewayTimeoutException => Texts.to.error.network.gatewayTimeoutException,
        NetworkExceptions.insufficientStorageException => Texts.to.error.network.insufficientStorageException,
        NetworkExceptions.loopDetectedException => Texts.to.error.network.loopDetectedException,
        NetworkExceptions.bandwidthLimitException => Texts.to.error.network.bandwidthLimitException,
        NetworkExceptions.notExtendedException => Texts.to.error.network.notExtendedException,
        NetworkExceptions.networkAuthRequiredException => Texts.to.error.network.networkAuthRequiredException,
        NetworkExceptions.unknownException => Texts.to.error.network.unknownException,
      };
}

extension NetworkExceptionsListExtension on List<NetworkExceptions> {
  NetworkExceptions find(int statusCode) => NetworkExceptions.values.firstWhere(
        (element) => element.statusCode == statusCode,
        orElse: () => NetworkExceptions.unknownException,
      );
}
