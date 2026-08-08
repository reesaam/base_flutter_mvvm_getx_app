import 'package:dio/dio.dart' as dio;

/// Retries idempotent GET requests on transient failures.
class RetryInterceptor extends dio.Interceptor {
  RetryInterceptor(
    this._dio, {
    this.maxRetries = 2,
    this.retryDelay = const Duration(milliseconds: 400),
  });

  final dio.Dio _dio;
  final int maxRetries;
  final Duration retryDelay;

  static const _retryKey = 'retry_count';

  @override
  Future<void> onError(dio.DioException err, dio.ErrorInterceptorHandler handler) async {
    final shouldRetry = _isRetriable(err);
    final count = err.requestOptions.extra[_retryKey] as int? ?? 0;

    if (!shouldRetry || count >= maxRetries) {
      return handler.next(err);
    }

    err.requestOptions.extra[_retryKey] = count + 1;
    await Future<void>.delayed(retryDelay * (count + 1));

    try {
      final response = await _dio.fetch<dynamic>(err.requestOptions);
      return handler.resolve(response);
    } on dio.DioException catch (e) {
      return handler.next(e);
    }
  }

  bool _isRetriable(dio.DioException err) {
    final method = err.requestOptions.method.toUpperCase();
    if (method != 'GET' && method != 'HEAD') return false;
    return switch (err.type) {
      dio.DioExceptionType.connectionTimeout ||
      dio.DioExceptionType.sendTimeout ||
      dio.DioExceptionType.receiveTimeout ||
      dio.DioExceptionType.connectionError =>
        true,
      dio.DioExceptionType.badResponse =>
        err.response?.statusCode == 502 ||
            err.response?.statusCode == 503 ||
            err.response?.statusCode == 504,
      _ => false,
    };
  }
}
