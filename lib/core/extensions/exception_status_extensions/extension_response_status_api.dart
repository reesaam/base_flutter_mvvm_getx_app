import '../../../barrels/services_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/localization_barrel.dart';

extension APIResponseStatusListExtension on List<ResponseStatusAPI> {
  ResponseStatusAPI find(int statusCode) => firstWhereOrNull((s) => s.statusCode == statusCode) ?? ResponseStatusAPI.unknownException;
}

extension NetworkExceptionsExtension on ResponseStatusAPI {
  NetworkException get exception => NetworkException(statusCode: statusCode, message: message);

  String get message => switch (this) {
    ResponseStatusAPI.success => Texts.to.network.api.exceptionNonAuthoritativeInformation,
    ResponseStatusAPI.created => Texts.to.network.api.exceptionNonAuthoritativeInformation,
    ResponseStatusAPI.nonAuthoritativeInformationException => Texts.to.network.api.exceptionNonAuthoritativeInformation,
    ResponseStatusAPI.noContentException => Texts.to.network.api.exceptionNoContent,
    ResponseStatusAPI.notModifiedException => Texts.to.network.api.exceptionNotModified,
    ResponseStatusAPI.unauthorizedException => Texts.to.network.api.exceptionUnauthorized,
    ResponseStatusAPI.paymentRequiredException => Texts.to.network.api.exceptionPaymentRequired,
    ResponseStatusAPI.forbiddenException => Texts.to.network.api.exceptionForbidden,
    ResponseStatusAPI.notFoundException => Texts.to.network.api.exceptionNotFound,
    ResponseStatusAPI.methodNotAllowedException => Texts.to.network.api.exceptionMethodNotAllowed,
    ResponseStatusAPI.notAcceptableException => Texts.to.network.api.exceptionNotAcceptable,
    ResponseStatusAPI.proxyAuthRequiredException => Texts.to.network.api.exceptionProxyAuthRequired,
    ResponseStatusAPI.requestTimeoutException => Texts.to.network.api.exceptionRequestTimeout,
    ResponseStatusAPI.conflictException => Texts.to.network.api.exceptionConflict,
    ResponseStatusAPI.lengthRequiredException => Texts.to.network.api.exceptionLengthRequired,
    ResponseStatusAPI.preConditionFailedException => Texts.to.network.api.exceptionPreConditionFailed,
    ResponseStatusAPI.requestEntityTooLargeException => Texts.to.network.api.exceptionRequestEntityTooLarge,
    ResponseStatusAPI.requestUriTooLongException => Texts.to.network.api.exceptionRequestUriTooLong,
    ResponseStatusAPI.unsupportedMediaTypeException => Texts.to.network.api.exceptionUnsupportedMediaType,
    ResponseStatusAPI.requestedRangeNotSatisfiableException => Texts.to.network.api.exceptionRequestedRangeNotSatisfiable,
    ResponseStatusAPI.expectationFailedException => Texts.to.network.api.exceptionExpectationFailed,
    ResponseStatusAPI.unProcessableEntityException => Texts.to.network.api.exceptionUnProcessableEntity,
    ResponseStatusAPI.failedDependencyException => Texts.to.network.api.exceptionFailedDependency,
    ResponseStatusAPI.unorderedCollectionException => Texts.to.network.api.exceptionUnorderedCollection,
    ResponseStatusAPI.upgradeRequiredException => Texts.to.network.api.exceptionUpgradeRequired,
    ResponseStatusAPI.tooManyRequestException => Texts.to.network.api.exceptionTooManyRequest,
    ResponseStatusAPI.requestHeaderFieldsTooLargeException => Texts.to.network.api.exceptionRequestHeaderFieldsTooLarge,
    ResponseStatusAPI.noResponseException => Texts.to.network.api.exceptionNoResponse,
    ResponseStatusAPI.unavailableForLegalReasonsException => Texts.to.network.api.exceptionUnavailableForLegalReasons,
    ResponseStatusAPI.requestHeaderTooLargeException => Texts.to.network.api.exceptionRequestHeaderTooLarge,
    ResponseStatusAPI.internalServerErrorException => Texts.to.network.api.exceptionInternalServerError,
    ResponseStatusAPI.notImplementedException => Texts.to.network.api.exceptionNotImplemented,
    ResponseStatusAPI.badGatewayException => Texts.to.network.api.exceptionBadGateway,
    ResponseStatusAPI.serviceUnavailableException => Texts.to.network.api.exceptionServiceUnavailable,
    ResponseStatusAPI.gatewayTimeoutException => Texts.to.network.api.exceptionGatewayTimeout,
    ResponseStatusAPI.insufficientStorageException => Texts.to.network.api.exceptionInsufficientStorage,
    ResponseStatusAPI.loopDetectedException => Texts.to.network.api.exceptionLoopDetected,
    ResponseStatusAPI.bandwidthLimitException => Texts.to.network.api.exceptionBandwidthLimit,
    ResponseStatusAPI.notExtendedException => Texts.to.network.api.exceptionNotExtended,
    ResponseStatusAPI.networkAuthRequiredException => Texts.to.network.api.exceptionNetworkAuthRequired,
    ResponseStatusAPI.unknownException => Texts.to.network.api.exceptionUnknown,
  };
}
