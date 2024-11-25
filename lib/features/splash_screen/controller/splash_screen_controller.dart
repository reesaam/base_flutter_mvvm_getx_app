import 'package:getx_binding_annotation/annotation.dart';

import '../../../components/statistics/statistics.dart';
import '../../../core/app_localization.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_info/app_info.dart';
import '../../../core/core_resources/core_enums.dart';
import '../../../core/core_resources/core_flags.dart';
import '../../../core/core_resources/logos.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../shared/shared_models/core_models/app_version/app_version.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';

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
    pageDetail = AppPageDetails.splashScreen;
    logoSource = AppLogos.appLogo;
    appName = AppInfo.appName;
    appVersion = '${Texts.to.version}: ${AppInfo.currentVersion.version}';
  }

  @override
  void onReadyFunction() async {
    availableUpdate = await checkAvailableVersion();
    (availableUpdate != null && availableUpdate?.version != AppInfo.currentVersion.version)
        ? _showUpdateDialog(isForceUpdate: availableUpdate?.isForceUpdate)
        : goToPageWithDelay(AppPageDetails.homepage);
  }

  _showUpdateDialog({bool? isForceUpdate}) => AppAlertDialogs.withYesNo(
        title: Texts.to.updateNewVersion,
        text: Texts.to.updateApprove,
        dismissible: isForceUpdate != true,
        onTapNo: isForceUpdate == true ? null : goToHomePage,
        onTapYes: () {
          if (isForceUpdate != true) goToHomePage();
          goToUpdatePage();
        },
      );
}
