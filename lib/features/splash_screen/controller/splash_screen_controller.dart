import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';
// ignore: only_barrel_imports
import '../../auth/data/auth_session.dart';

@GetPut.controller()
class SplashScreenController extends CoreController {
  late bool internetStatus;
  late AppVersion? availableUpdate;
  late String permissionsStatus;

  late String logoSource;
  late String appName;
  late String appVersion;

  @override
  void dataInit() async {
    CoreFlags.clearData ? clearAppData() : null;
    AppStatistics.to.increaseLaunch();
    printAllData();
  }

  @override
  void pageInit() {
    pageDetail = AppPages.splashScreen;
    logoSource = AppLogos.appLogo;
    appName = AppInfo.appName;
    appVersion = '${Texts.to.general.version}: ${AppInfo.currentVersion.version}';
  }

  @override
  void onReadyFunction() async {
    await AuthSession.to.restoreSession();
    final next = AuthSession.to.isAuthenticated.value ? AppPages.homepage : AppPages.login;
    goToPage(next, popAll: true);
  }

  // ignore: unused_element
  void _showUpdateDialog({bool? isForceUpdate}) => AppAlertDialogs.withYesNo(
        title: Texts.to.update.updateNewVersion,
        text: Texts.to.update.updateApprove,
        dismissible: isForceUpdate != true,
        onTapNo: () => isForceUpdate == true ? null : goToPage(AppPages.homepage),
        onTapYes: () {
          if (isForceUpdate != true) goToPage(AppPages.homepage);
          goToPage(AppPages.update);
        },
      );
}
