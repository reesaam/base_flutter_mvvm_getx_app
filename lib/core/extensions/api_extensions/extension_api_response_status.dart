import 'package:get/get.dart';

import '../../../components/failures/network_exception.dart';
import '../../../localization/localizations.dart';

extension APIResponseStatusListExtension on List<APIResponseStatus> {
  APIResponseStatus find(int statusCode) =>
      firstWhereOrNull((s) => s.statusCode == statusCode) ?? APIResponseStatus.unknownException;
}

extension NetworkExceptionsExtension on APIResponseStatus {
  NetworkException get exception => NetworkException(statusCode: statusCode, message: message);

  String get message => switch (this) {
        APIResponseStatus.success => Texts.to.error.network.nonAuthoritativeInformationException,
        APIResponseStatus.created => Texts.to.error.network.nonAuthoritativeInformationException,
        APIResponseStatus.nonAuthoritativeInformationException => Texts.to.error.network.nonAuthoritativeInformationException,
        APIResponseStatus.noContentException => Texts.to.error.network.noContentException,
        APIResponseStatus.notModifiedException => Texts.to.error.network.notModifiedException,
        APIResponseStatus.unauthorizedException => Texts.to.error.network.unauthorizedException,
        APIResponseStatus.paymentRequiredException => Texts.to.error.network.paymentRequiredException,
        APIResponseStatus.forbiddenException => Texts.to.error.network.forbiddenException,
        APIResponseStatus.notFoundException => Texts.to.error.network.notFoundException,
        APIResponseStatus.methodNotAllowedException => Texts.to.error.network.methodNotAllowedException,
        APIResponseStatus.notAcceptableException => Texts.to.error.network.notAcceptableException,
        APIResponseStatus.proxyAuthRequiredException => Texts.to.error.network.proxyAuthRequiredException,
        APIResponseStatus.requestTimeoutException => Texts.to.error.network.requestTimeoutException,
        APIResponseStatus.conflictException => Texts.to.error.network.conflictException,
        APIResponseStatus.lengthRequiredException => Texts.to.error.network.lengthRequiredException,
        APIResponseStatus.preConditionFailedException => Texts.to.error.network.preConditionFailedException,
        APIResponseStatus.requestEntityTooLargeException => Texts.to.error.network.requestEntityTooLargeException,
        APIResponseStatus.requestUriTooLongException => Texts.to.error.network.requestUriTooLongException,
        APIResponseStatus.unsupportedMediaTypeException => Texts.to.error.network.unsupportedMediaTypeException,
        APIResponseStatus.requestedRangeNotSatisfiableException => Texts.to.error.network.requestedRangeNotSatisfiableException,
        APIResponseStatus.expectationFailedException => Texts.to.error.network.expectationFailedException,
        APIResponseStatus.unProcessableEntityException => Texts.to.error.network.unProcessableEntityException,
        APIResponseStatus.failedDependencyException => Texts.to.error.network.failedDependencyException,
        APIResponseStatus.unorderedCollectionException => Texts.to.error.network.unorderedCollectionException,
        APIResponseStatus.upgradeRequiredException => Texts.to.error.network.upgradeRequiredException,
        APIResponseStatus.tooManyRequestException => Texts.to.error.network.tooManyRequestException,
        APIResponseStatus.requestHeaderFieldsTooLargeException => Texts.to.error.network.requestHeaderFieldsTooLargeException,
        APIResponseStatus.noResponseException => Texts.to.error.network.noResponseException,
        APIResponseStatus.unavailableForLegalReasonsException => Texts.to.error.network.unavailableForLegalReasonsException,
        APIResponseStatus.requestHeaderTooLargeException => Texts.to.error.network.requestHeaderTooLargeException,
        APIResponseStatus.internalServerErrorException => Texts.to.error.network.internalServerErrorException,
        APIResponseStatus.notImplementedException => Texts.to.error.network.notImplementedException,
        APIResponseStatus.badGatewayException => Texts.to.error.network.badGatewayException,
        APIResponseStatus.serviceUnavailableException => Texts.to.error.network.serviceUnavailableException,
        APIResponseStatus.gatewayTimeoutException => Texts.to.error.network.gatewayTimeoutException,
        APIResponseStatus.insufficientStorageException => Texts.to.error.network.insufficientStorageException,
        APIResponseStatus.loopDetectedException => Texts.to.error.network.loopDetectedException,
        APIResponseStatus.bandwidthLimitException => Texts.to.error.network.bandwidthLimitException,
        APIResponseStatus.notExtendedException => Texts.to.error.network.notExtendedException,
        APIResponseStatus.networkAuthRequiredException => Texts.to.error.network.networkAuthRequiredException,
        APIResponseStatus.unknownException => Texts.to.error.network.unknownException,
      };
}
