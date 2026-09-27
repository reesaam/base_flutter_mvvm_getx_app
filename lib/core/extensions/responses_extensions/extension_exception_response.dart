import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';

extension SetExceptionBaseResponse on BaseResponse {
  BaseResponse<T?> setResponseStatus<T>({required ResponseStatus status, T? data, String? customMessage}) =>
      bimap((l) => GeneralException(message: customMessage ?? status.message, statusCode: status.statusCode), (r) => data);

  BaseResponse<T?> setLocalResponseStatus<T>({required ResponseStatusLocal localStatus, T? data, String? customMessage}) =>
      bimap((l) => NetworkException(message: customMessage ?? localStatus.message, statusCode: localStatus.statusCode), (r) => data);
}

extension SetExceptionLocalException on BaseLocalResponse {
  BaseResponse<T?> setResponseStatus<T>({required ResponseStatus status, T? data, String? customMessage}) =>
      (this as BaseResponse).setResponseStatus(status: status, data: data, customMessage: customMessage);
}

extension SetExceptionNetworkException on BaseAPIResponse {
  BaseResponse<T?> setResponseStatus<T>({required ResponseStatusLocal localStatus, T? data, String? customMessage}) =>
      (this as BaseResponse).setLocalResponseStatus<T>(localStatus: localStatus, data: data, customMessage: customMessage);
}
