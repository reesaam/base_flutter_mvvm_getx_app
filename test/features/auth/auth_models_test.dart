import 'package:flutter_test/flutter_test.dart';
import 'package:base_flutter_mvvm_getx_app/features/auth/models/auth_models.dart';

void main() {
  group('AuthTokens', () {
    test('fromJson / toJson round-trip', () {
      final tokens = AuthTokens.fromJson({
        'accessToken': 'abc',
        'refreshToken': 'def',
        'expiresAt': '2030-01-01T00:00:00.000',
      });

      expect(tokens.accessToken, 'abc');
      expect(tokens.refreshToken, 'def');
      expect(tokens.isExpired, isFalse);
      expect(tokens.toJson()['accessToken'], 'abc');
    });

    test('isExpired when expiresAt is in the past', () {
      final tokens = AuthTokens(accessToken: 'x', expiresAt: DateTime.now().subtract(const Duration(minutes: 1)));
      expect(tokens.isExpired, isTrue);
    });
  });

  group('AuthLoginResult', () {
    test('parses nested user and tokens', () {
      final result = AuthLoginResult.fromJson({
        'tokens': {'accessToken': 't1', 'refreshToken': 't2'},
        'user': {'id': '1', 'email': 'a@b.com', 'displayName': 'A'},
      });

      expect(result.tokens.accessToken, 't1');
      expect(result.user.email, 'a@b.com');
      expect(result.user.displayName, 'A');
    });
  });
}
