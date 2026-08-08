import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';
import '../controller/auth_controller.dart';

@GetPut.page()
class LoginPage extends CoreView<AuthController> {
  const LoginPage({super.key});

  @override
  bool get enableBodyScroll => true;

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.pages;

  @override
  Widget get body => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSpaces.h40,
            Text(AppInfo.appName).withSizeTitleLarge,
            AppSpaces.h10,
            const Text('Sign in to continue').withSizeBodyMedium,
            AppSpaces.h40,
            AppTextField.general(
              controller: controller.emailController,
              label: 'Email',
              hint: 'you@example.com',
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            AppSpaces.h20,
            AppTextField.general(
              controller: controller.passwordController,
              label: 'Password',
              hint: '••••••••',
              isPassword: controller.obscurePassword.value,
              textInputAction: TextInputAction.done,
              suffixAction: controller.toggleObscurePassword,
            ),
            if (controller.errorMessage.value != null) ...[
              AppSpaces.h20,
              Text(controller.errorMessage.value!).withColor(AppColors.error.color),
            ],
            AppSpaces.h40,
            AppButton.filled(
              text: 'Sign In',
              loading: controller.isLoading.value,
              onTap: controller.login,
            ),
            AppSpaces.h20,
            const Text('Demo mode accepts any non-empty credentials.').withSizeBodySmall,
          ],
        ),
      );
}
