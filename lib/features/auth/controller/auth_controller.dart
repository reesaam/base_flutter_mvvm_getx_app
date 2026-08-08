import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../data/auth_remote_data_source.dart';
import '../data/auth_session.dart';

@GetPut.controller()
class AuthController extends CoreController {
  static AuthController get to => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final obscurePassword = true.obs;
  final errorMessage = RxnString();

  @override
  void pageInit() {
    pageDetail = AppPages.login;
  }

  @override
  void onCloseFunction() {
    emailController.dispose();
    passwordController.dispose();
  }

  void toggleObscurePassword() => obscurePassword.toggle();

  Future<void> login() async {
    errorMessage.value = null;
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      errorMessage.value = 'Email and password are required';
      return;
    }

    isLoading.value = true;
    final result = await AuthRemoteDataSource.to.login(email: email, password: password);
    await result.fold(
      (l) async {
        errorMessage.value = l.message ?? 'Login failed';
      },
      (r) async {
        await AuthSession.to.persistSession(tokens: r.tokens, user: r.user);
        goToPage(AppPages.homepage, popAll: true);
      },
    );
    isLoading.value = false;
  }

  Future<void> logout() async {
    isLoading.value = true;
    await AuthRemoteDataSource.to.logout();
    await AuthSession.to.clearSession();
    isLoading.value = false;
    goToPage(AppPages.login, popAll: true);
  }
}
