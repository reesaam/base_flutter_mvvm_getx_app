import '../../../barrels/components_barrel.dart';
import '../../../barrels/services_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/localization_barrel.dart';

extension APIResponseStatusListExtension on List<ResponseStatus> {
  ResponseStatus find(int statusCode) => firstWhereOrNull((s) => s.statusCode == statusCode) ?? ResponseStatus.unknownException;
}

extension NetworkExceptionsExtension on ResponseStatus {
  NetworkException exception({StackTrace? stackTrace}) => NetworkException(statusCode: statusCode, message: message, stackTrace: stackTrace);

  String get message => switch (this) {
    ResponseStatus.success => Texts.to.network.api.exceptionNonAuthoritativeInformation,
    ResponseStatus.created => Texts.to.network.api.exceptionNonAuthoritativeInformation,
    ResponseStatus.nonAuthoritativeInformationException => Texts.to.network.api.exceptionNonAuthoritativeInformation,
    ResponseStatus.noContentException => Texts.to.network.api.exceptionNoContent,
    ResponseStatus.notModifiedException => Texts.to.network.api.exceptionNotModified,
    ResponseStatus.unauthorizedException => Texts.to.network.api.exceptionUnauthorized,
    ResponseStatus.paymentRequiredException => Texts.to.network.api.exceptionPaymentRequired,
    ResponseStatus.forbiddenException => Texts.to.network.api.exceptionForbidden,
    ResponseStatus.notFoundException => Texts.to.network.api.exceptionNotFound,
    ResponseStatus.methodNotAllowedException => Texts.to.network.api.exceptionMethodNotAllowed,
    ResponseStatus.notAcceptableException => Texts.to.network.api.exceptionNotAcceptable,
    ResponseStatus.proxyAuthRequiredException => Texts.to.network.api.exceptionProxyAuthRequired,
    ResponseStatus.requestTimeoutException => Texts.to.network.api.exceptionRequestTimeout,
    ResponseStatus.conflictException => Texts.to.network.api.exceptionConflict,
    ResponseStatus.lengthRequiredException => Texts.to.network.api.exceptionLengthRequired,
    ResponseStatus.preConditionFailedException => Texts.to.network.api.exceptionPreConditionFailed,
    ResponseStatus.requestEntityTooLargeException => Texts.to.network.api.exceptionRequestEntityTooLarge,
    ResponseStatus.requestUriTooLongException => Texts.to.network.api.exceptionRequestUriTooLong,
    ResponseStatus.unsupportedMediaTypeException => Texts.to.network.api.exceptionUnsupportedMediaType,
    ResponseStatus.requestedRangeNotSatisfiableException => Texts.to.network.api.exceptionRequestedRangeNotSatisfiable,
    ResponseStatus.expectationFailedException => Texts.to.network.api.exceptionExpectationFailed,
    ResponseStatus.unProcessableEntityException => Texts.to.network.api.exceptionUnProcessableEntity,
    ResponseStatus.failedDependencyException => Texts.to.network.api.exceptionFailedDependency,
    ResponseStatus.unorderedCollectionException => Texts.to.network.api.exceptionUnorderedCollection,
    ResponseStatus.upgradeRequiredException => Texts.to.network.api.exceptionUpgradeRequired,
    ResponseStatus.tooManyRequestException => Texts.to.network.api.exceptionTooManyRequest,
    ResponseStatus.requestHeaderFieldsTooLargeException => Texts.to.network.api.exceptionRequestHeaderFieldsTooLarge,
    ResponseStatus.noResponseException => Texts.to.network.api.exceptionNoResponse,
    ResponseStatus.unavailableForLegalReasonsException => Texts.to.network.api.exceptionUnavailableForLegalReasons,
    ResponseStatus.requestHeaderTooLargeException => Texts.to.network.api.exceptionRequestHeaderTooLarge,
    ResponseStatus.internalServerErrorException => Texts.to.network.api.exceptionInternalServerError,
    ResponseStatus.notImplementedException => Texts.to.network.api.exceptionNotImplemented,
    ResponseStatus.badGatewayException => Texts.to.network.api.exceptionBadGateway,
    ResponseStatus.serviceUnavailableException => Texts.to.network.api.exceptionServiceUnavailable,
    ResponseStatus.gatewayTimeoutException => Texts.to.network.api.exceptionGatewayTimeout,
    ResponseStatus.insufficientStorageException => Texts.to.network.api.exceptionInsufficientStorage,
    ResponseStatus.loopDetectedException => Texts.to.network.api.exceptionLoopDetected,
    ResponseStatus.bandwidthLimitException => Texts.to.network.api.exceptionBandwidthLimit,
    ResponseStatus.notExtendedException => Texts.to.network.api.exceptionNotExtended,
    ResponseStatus.networkAuthRequiredException => Texts.to.network.api.exceptionNetworkAuthRequired,
    ResponseStatus.unknownException => Texts.to.network.api.exceptionUnknown,
  };
}
