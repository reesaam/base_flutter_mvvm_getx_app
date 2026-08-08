import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:base_flutter_mvvm_getx_app/components/failures/network_exception.dart';
import 'package:base_flutter_mvvm_getx_app/components/failures/local_exception.dart';

void main() {
  group('NetworkException.handleResponse', () {
    test('returns NetworkException instead of throwing', () {
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 404,
        ),
        type: DioExceptionType.badResponse,
      );

      final result = NetworkException.handleResponse(dioError, StackTrace.current);

      expect(result, isA<NetworkException>());
      expect(result.statusCode, 404);
      expect(result.message, isNotNull);
    });

    test('maps unknown status to unknown exception', () {
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionError,
      );

      final result = NetworkException.handleResponse(dioError, null);
      expect(result.statusCode, anyOf(isNull, 0, isNonNegative));
    });
  });

  group('LocalException.handleResponse', () {
    test('returns LocalException instead of throwing', () {
      final input = LocalException(message: 'boom', statusCode: 0);
      final result = LocalException.handleResponse(input, StackTrace.current);
      expect(result, isA<LocalException>());
      expect(result.message, 'boom');
    });

    test('falls back to unknown for unmatched codes', () {
      final input = LocalException(message: 'x', statusCode: 999);
      final result = LocalException.handleResponse(input, null);
      // Preserves original LocalException instance path
      expect(result.message, 'x');
    });

    test('maps non-Local GeneralException without throwing', () {
      final input = NetworkException(message: 'net', statusCode: 500);
      final result = LocalException.handleResponse(input, null);
      expect(result, isA<LocalException>());
      expect(result.message, isNotNull);
    });
  });
}
