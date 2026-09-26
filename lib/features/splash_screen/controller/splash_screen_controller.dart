import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/services_barrel.dart';
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
    AppStatisticsService.to.increaseLaunch();
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
    goToPage(AppPages.homepage, popAll: true);
  }

  // ignore: unused_element
  void _showUpdateDialog({bool? isForceUpdate}) => AppAlertDialogs.to.withTwoButtons(
    buttonText1: Texts.to.general.yes,
    buttonText2: Texts.to.general.no,
    title: Texts.to.update.updateNewVersion,
    text: Texts.to.update.updateApprove,
    dismissible: isForceUpdate != true,
    onTapButton1: () => goToPage(isForceUpdate != true ? AppPages.homepage : AppPages.update),
    onTapButton2: () => isForceUpdate == true ? null : goToPage(AppPages.homepage),
  );
}
