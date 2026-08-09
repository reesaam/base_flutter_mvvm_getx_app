import '../../../../barrels/annotations_barrel.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@FreezedCustom.model
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required final String id,
    required final String email,
    final String? displayName,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);
}
