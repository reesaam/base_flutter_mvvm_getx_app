import '../../../../barrels/annotations_barrel.dart';

part 'auth_tokens.freezed.dart';
part 'auth_tokens.g.dart';

@FreezedCustom.model
abstract class AuthTokens with _$AuthTokens {
  const AuthTokens._();

  const factory AuthTokens({
    required final String accessToken,
    final String? refreshToken,
    final DateTime? expiresAt,
  }) = _AuthTokens;

  factory AuthTokens.fromJson(Map<String, dynamic> json) => _$AuthTokensFromJson(json);

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
}
