import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

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
    // permissionsStatus = await AppPermissions.to.checkAllPermissions();
    // internetStatus = await ConnectionChecker.to.checkInternet();
    // internetStatus ? availableUpdate = await checkAvailableVersion() : noInternetConnectionSnackBar();
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
    // availableUpdate = await checkAvailableVersion();
    // (availableUpdate != null && availableUpdate?.version != AppInfo.currentVersion.version)
    //     ? _showUpdateDialog(isForceUpdate: availableUpdate?.isForceUpdate)
    //     : goToPageWithDelay(AppPageDetails.homepage);
    goToPage(AppPages.homepage);
  }

  _showUpdateDialog({bool? isForceUpdate}) => AppAlertDialogs.withYesNo(
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
