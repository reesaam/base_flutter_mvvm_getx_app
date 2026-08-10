import '../../../../barrels/annotations_barrel.dart';
import '../auth_tokens/auth_tokens.dart';
import '../auth_user/auth_user.dart';

part 'auth_login_result.freezed.dart';
part 'auth_login_result.g.dart';

@FreezedCustom.model
abstract class AuthLoginResult with _$AuthLoginResult {
  const factory AuthLoginResult({
    required final AuthTokens tokens,
    required final AuthUser user,
  }) = _AuthLoginResult;

  factory AuthLoginResult.fromJson(Map<String, dynamic> json) => _$AuthLoginResultFromJson(json);
}
