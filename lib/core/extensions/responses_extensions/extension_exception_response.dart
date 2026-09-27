import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';

extension SetExceptionBaseResponse on BaseResponse {
  BaseResponse setExceptionResponse<T extends GeneralException>(ResponseStatusLocalException exception) =>
      bimap((l) => LocalException(message: exception.message, statusCode: exception.statusCode), (r) => null);

  BaseResponse setNetworkExceptionResponse(ResponseStatusAPI response) =>
      bimap((l) => NetworkException(message: response.message, statusCode: response.statusCode), (r) => null);
}

extension SetExceptionLocalException on BaseLocalResponse {
  BaseResponse setExceptionResponse<T extends GeneralException>(ResponseStatusLocalException exception) =>
      bimap((l) => LocalException(message: exception.message, statusCode: exception.statusCode), (r) => null);
}

extension SetExceptionNetworkException on BaseAPIResponse {
  BaseResponse setNetworkExceptionResponse(ResponseStatusAPI response) =>
      bimap((l) => NetworkException(message: response.message, statusCode: response.statusCode), (r) => null);
}
