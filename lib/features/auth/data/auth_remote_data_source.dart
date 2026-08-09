import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../models/auth_models.dart';
import 'auth_session.dart';

abstract class AuthRemoteDataSource extends CoreRepository {
  static AuthRemoteDataSource get to => Get.find();

  Future<BaseAPIResponse<AuthLoginResult>> login({
    required String email,
    required String password,
  });

  Future<BaseAPIResponse<bool>> logout();

  Future<BaseAPIResponse<AuthUser>> me();
}

@GetPut.repository(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends CoreRepository implements AuthRemoteDataSource {
  @override
  Future<BaseAPIResponse<AuthLoginResult>> login({
    required String email,
    required String password,
  }) async {
    if (EnvConfig.authDemoMode) {
      if (email.trim().isEmpty || password.trim().isEmpty) {
        return Left(NetworkException(message: 'Email and password are required', statusCode: 400));
      }
      return Right(AuthSession.to.createDemoSession(email: email.trim()));
    }

    final result = await DioCore.to.callMethod<Map<String, dynamic>>(
      method: APIMethods.post,
      url: AppAPIUrls.apiLogin,
      data: {'email': email, 'password': password},
      skipAuth: true,
    );

    return result.map((data) => AuthLoginResult.fromJson(data));
  }

  @override
  Future<BaseAPIResponse<bool>> logout() async {
    if (EnvConfig.authDemoMode) {
      return const Right(true);
    }
    final result = await DioCore.to.callMethod<dynamic>(
      method: APIMethods.post,
      url: AppAPIUrls.apiLogout,
    );
    return result.map((_) => true);
  }

  @override
  Future<BaseAPIResponse<AuthUser>> me() async {
    if (EnvConfig.authDemoMode) {
      final user = AuthSession.to.currentUser.value;
      if (user == null) {
        return Left(NetworkException(message: 'Not authenticated', statusCode: 401));
      }
      return Right(user);
    }
    final result = await DioCore.to.callMethod<Map<String, dynamic>>(
      method: APIMethods.get,
      url: AppAPIUrls.apiMe,
    );
    return result.map(AuthUser.fromJson);
  }
}
