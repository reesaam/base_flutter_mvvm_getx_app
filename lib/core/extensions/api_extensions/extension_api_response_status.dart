import '../../../barrels/core_barrel.dart';

import '../../../components/failures/network_exception.dart';
import '../../../localization/localizations.dart';

extension APIResponseStatusListExtension on List<APIResponseStatus> {
  APIResponseStatus find(int statusCode) =>
      firstWhereOrNull((s) => s.statusCode == statusCode) ?? APIResponseStatus.unknownException;
}

extension NetworkExceptionsExtension on APIResponseStatus {
  NetworkException get exception => NetworkException(statusCode: statusCode, message: message);

  String get message => switch (this) {
        APIResponseStatus.success => Texts.to.network.api.exceptionNonAuthoritativeInformation,
        APIResponseStatus.created => Texts.to.network.api.exceptionNonAuthoritativeInformation,
        APIResponseStatus.nonAuthoritativeInformationException => Texts.to.network.api.exceptionNonAuthoritativeInformation,
        APIResponseStatus.noContentException => Texts.to.network.api.exceptionNoContent,
        APIResponseStatus.notModifiedException => Texts.to.network.api.exceptionNotModified,
        APIResponseStatus.unauthorizedException => Texts.to.network.api.exceptionUnauthorized,
        APIResponseStatus.paymentRequiredException => Texts.to.network.api.exceptionPaymentRequired,
        APIResponseStatus.forbiddenException => Texts.to.network.api.exceptionForbidden,
        APIResponseStatus.notFoundException => Texts.to.network.api.exceptionNotFound,
        APIResponseStatus.methodNotAllowedException => Texts.to.network.api.exceptionMethodNotAllowed,
        APIResponseStatus.notAcceptableException => Texts.to.network.api.exceptionNotAcceptable,
        APIResponseStatus.proxyAuthRequiredException => Texts.to.network.api.exceptionProxyAuthRequired,
        APIResponseStatus.requestTimeoutException => Texts.to.network.api.exceptionRequestTimeout,
        APIResponseStatus.conflictException => Texts.to.network.api.exceptionConflict,
        APIResponseStatus.lengthRequiredException => Texts.to.network.api.exceptionLengthRequired,
        APIResponseStatus.preConditionFailedException => Texts.to.network.api.exceptionPreConditionFailed,
        APIResponseStatus.requestEntityTooLargeException => Texts.to.network.api.exceptionRequestEntityTooLarge,
        APIResponseStatus.requestUriTooLongException => Texts.to.network.api.exceptionRequestUriTooLong,
        APIResponseStatus.unsupportedMediaTypeException => Texts.to.network.api.exceptionUnsupportedMediaType,
        APIResponseStatus.requestedRangeNotSatisfiableException => Texts.to.network.api.exceptionRequestedRangeNotSatisfiable,
        APIResponseStatus.expectationFailedException => Texts.to.network.api.exceptionExpectationFailed,
        APIResponseStatus.unProcessableEntityException => Texts.to.network.api.exceptionUnProcessableEntity,
        APIResponseStatus.failedDependencyException => Texts.to.network.api.exceptionFailedDependency,
        APIResponseStatus.unorderedCollectionException => Texts.to.network.api.exceptionUnorderedCollection,
        APIResponseStatus.upgradeRequiredException => Texts.to.network.api.exceptionUpgradeRequired,
        APIResponseStatus.tooManyRequestException => Texts.to.network.api.exceptionTooManyRequest,
        APIResponseStatus.requestHeaderFieldsTooLargeException => Texts.to.network.api.exceptionRequestHeaderFieldsTooLarge,
        APIResponseStatus.noResponseException => Texts.to.network.api.exceptionNoResponse,
        APIResponseStatus.unavailableForLegalReasonsException => Texts.to.network.api.exceptionUnavailableForLegalReasons,
        APIResponseStatus.requestHeaderTooLargeException => Texts.to.network.api.exceptionRequestHeaderTooLarge,
        APIResponseStatus.internalServerErrorException => Texts.to.network.api.exceptionInternalServerError,
        APIResponseStatus.notImplementedException => Texts.to.network.api.exceptionNotImplemented,
        APIResponseStatus.badGatewayException => Texts.to.network.api.exceptionBadGateway,
        APIResponseStatus.serviceUnavailableException => Texts.to.network.api.exceptionServiceUnavailable,
        APIResponseStatus.gatewayTimeoutException => Texts.to.network.api.exceptionGatewayTimeout,
        APIResponseStatus.insufficientStorageException => Texts.to.network.api.exceptionInsufficientStorage,
        APIResponseStatus.loopDetectedException => Texts.to.network.api.exceptionLoopDetected,
        APIResponseStatus.bandwidthLimitException => Texts.to.network.api.exceptionBandwidthLimit,
        APIResponseStatus.notExtendedException => Texts.to.network.api.exceptionNotExtended,
        APIResponseStatus.networkAuthRequiredException => Texts.to.network.api.exceptionNetworkAuthRequired,
        APIResponseStatus.unknownException => Texts.to.network.api.exceptionUnknown,
      };
}
