enum APIStatus {
  success(statusCode: 200),
  failure(statusCode: 0);

  final int? statusCode;
  const APIStatus({required this.statusCode});
}