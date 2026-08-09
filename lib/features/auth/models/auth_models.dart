class AuthTokens {
  const AuthTokens({required this.accessToken, this.refreshToken, this.expiresAt});

  final String accessToken;
  final String? refreshToken;
  final DateTime? expiresAt;

  factory AuthTokens.fromJson(Map<String, dynamic> json) => AuthTokens(
    accessToken: json['access_token'] as String? ?? json['accessToken'] as String? ?? '',
    refreshToken: json['refresh_token'] as String? ?? json['refreshToken'] as String?,
    expiresAt: json['expires_at'] != null
        ? DateTime.tryParse(json['expires_at'] as String)
        : json['expiresAt'] != null
        ? DateTime.tryParse(json['expiresAt'] as String)
        : null,
  );

  Map<String, dynamic> toJson() => {'access_token': accessToken, 'refresh_token': refreshToken, 'expires_at': expiresAt?.toIso8601String()};

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
}

class AuthUser {
  const AuthUser({required this.id, required this.email, this.displayName});

  final String id;
  final String email;
  final String? displayName;

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
    id: '${json['id'] ?? ''}',
    email: json['email'] as String? ?? '',
    displayName: json['display_name'] as String? ?? json['displayName'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'email': email, 'display_name': displayName};
}

class AuthLoginResult {
  const AuthLoginResult({required this.tokens, required this.user});

  final AuthTokens tokens;
  final AuthUser user;

  factory AuthLoginResult.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>? ?? json;
    final tokensJson = json['tokens'] as Map<String, dynamic>? ?? json;
    return AuthLoginResult(tokens: AuthTokens.fromJson(tokensJson), user: AuthUser.fromJson(userJson));
  }
}
