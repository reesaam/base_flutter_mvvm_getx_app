import 'dart:io';

import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

// ignore: barrel_import_lints/only_barrel_imports
import 'package:path_provider/path_provider.dart';
// ignore: barrel_import_lints/only_barrel_imports
import 'package:open_file_plus/open_file_plus.dart' as file_plus;
// ignore: barrel_import_lints/only_barrel_imports
import '../../versions/controller/versions_controller.dart';
// ignore: barrel_import_lints/only_barrel_imports
import '../data/update_remote_data_source.dart';

@GetPut.controller()
class UpdateController extends CoreController {
  Rx<String> availableVersion = Texts.to.general.notAvailable.obs;

  File? dlFile;
  Directory? dlDir;

  Rx<bool> downloaded = false.obs;

  Rx<bool> buttonCheckUpdateLoading = false.obs;
  Rx<bool> buttonDownloadUpdateLoading = false.obs;

  @override
  void pageInit() {
    pageDetail = AppPages.update;
  }

  @override
  void onInitFunction() {
    downloaded.listen((data) {}).onData((data) => data == true ? popPage() : null);
  }

  @override
  void onReadyFunction() async {
    CoreFlags.checkUpdate ? await checkUpdate() : null;
  }

  bool updateAvailability() => availableVersion.value == AppInfo.currentVersion.version || availableVersion.value == Texts.to.general.notAvailable;

  Future<void> checkUpdate() async {
    buttonCheckUpdateLoading.value = true;
    AppBottomSheet().withoutButton(title: Texts.to.update.updateCheckingUpdate, form: AppProgressIndicator.linear());
    bool internetStatus = await AppConnectionChecker.to.checkInternet();
    if (internetStatus) {
      AppVersion? version = await VersionsController.to.checkUpdateAvailableVersion();
      popPage();
      if (version == null || version.version == AppInfo.currentVersion.version) {
        appLogPrint('No New Version Available');
        AppSnackBar.show(message: Texts.to.update.updateNoUpdateFound);
      } else {
        appLogPrint('Available Version: ${version.version}');
        availableVersion.value = version.version;
        AppSnackBar.show(
          message: '${Texts.to.update.updateUpdateFound}\n${Texts.to.general.version.withDoubleDots} $version',
        );
      }
    } else {
      noInternetConnectionSnackBar();
    }
  }

  void downloadUpdate() async {
    buttonDownloadUpdateLoading.value = true;
    AppBottomSheet().withoutButton(title: Texts.to.update.updateDownloading, form: AppProgressIndicator.linear());
    bool internetStatus = await AppConnectionChecker.to.checkInternet();
    if (!internetStatus) {
      noInternetConnectionSnackBar();
      return;
    }
    dlDir = await getExternalStorageDirectory();
    if (dlDir != null) {
      _alertDirectoryOrFileNotFound(dlDir == null);
      return;
    }
    File? dlFile = File('${dlDir!.path}/${AppTexts.updateAppFilename}');
    if (dlFile.existsSync()) dlFile.deleteSync();
    downloaded.value = false;
    String downloadAddress = Texts.to.general.empty;
    final resultAddress = await UpdateRemoteDataSource.to.getDownloadAddress();
    resultAddress.fold((l) => showErrorDialog(message: l.toString()), (r) => downloadAddress = r);
    if (downloadAddress.isEmpty) {
      _alertDirectoryOrFileNotFound(dlDir == null);
      return;
    }
    final result = await UpdateRemoteDataSource.to.updateDownload(savePath: dlFile.path);
    result.fold((l) => showErrorDialog(message: l.toString()), (r) {
      dlFile = r;
      downloaded.value = true;
      appDebugPrint((dlFile?.length() ?? 0).toString());
      AppSnackBar.show(message: Texts.to.update.updateDownloaded);
      AppAlertDialogs.withOkCancel(
        title: Texts.to.update.updateInstallationTitle,
        text: Texts.to.update.updateInstallationContent,
        onTapOk: _installUpdateFunction,
        dismissible: true,
      );
    });

    buttonDownloadUpdateLoading.value = false;
  }

  void _installUpdateFunction() => dlFile == null ? _alertDirectoryOrFileNotFound(false) : file_plus.OpenFile.open(dlFile!.path);

  _alertDirectoryOrFileNotFound(bool directoryError) => showErrorDialog(
      title: directoryError ? Texts.to.update.updateDirectoryNotFoundTitle : Texts.to.update.updateFileNotFoundTitle,
      message: directoryError ? Texts.to.update.updateDirectoryNotFoundContent : Texts.to.update.updateFileNotFoundContent);
}
