import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';
import 'package:open_file_plus/open_file_plus.dart' as file_plus;
import 'package:path_provider/path_provider.dart';

import '../../../components/connectivity/connectivity.dart';
import '../../../core/app_localization.dart';
import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_info/app_info.dart';
import '../../../core/core_resources/core_flags.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../core/core_resources/texts.dart';
import '../../../core/extensions/extensions_on_data_types/extension_string.dart';
import '../../../shared/shared_models/core_models/app_version/app_version.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';
import '../../../ui_kit/dialogs/app_bottom_dialogs.dart';
import '../../../ui_kit/dialogs/specific_dialogs/core_dialogs.dart';
import '../../../ui_kit/main_widgets/progress_indicator.dart';
import '../../../ui_kit/main_widgets/snackbar.dart';
import '../data/update_remote_data_source.dart';

@GetPut.controller()
class UpdateController extends CoreController {
  Rx<String> availableVersion = Texts.to.notAvailable.obs;

  File? dlFile;
  Directory? dlDir;

  Rx<bool> downloaded = false.obs;

  Rx<bool> buttonCheckUpdateLoading = false.obs;
  Rx<bool> buttonDownloadUpdateLoading = false.obs;

  @override
  void pageInit() {
    pageDetail = AppPageDetails.update;
  }

  @override
  void onInitFunction() {
    downloaded.listen((data) {}).onData((data) => data == true ? popPage() : null);
  }

  @override
  void onReadyFunction() async {
    CoreFlags.checkUpdate ? await checkUpdateFunction() : null;
  }

  bool updateAvailability() => availableVersion.value == AppInfo.currentVersion.version || availableVersion.value == Texts.to.notAvailable;

  checkUpdateFunction() async {
    buttonCheckUpdateLoading.value = true;
    bool internetStatus = await AppConnectionChecker.to.checkInternet();
    internetStatus ? await _checkUpdateFunction() : noInternetConnectionSnackBar();
    buttonCheckUpdateLoading.value = false;
  }

  Future<void> _checkUpdateFunction() async {
    AppBottomDialogs().withoutButton(title: Texts.to.updateCheckingUpdate, form: AppProgressIndicator.linear());
    AppVersion? version = await checkAvailableVersion();
    popPage();
    if (version == null || version.version == AppInfo.currentVersion.version) {
      appLogPrint('No New Version Available');
      AppSnackBar.show(message: Texts.to.updateNoUpdateFound);
    } else {
      appLogPrint('Available Version: ${version.version}');
      availableVersion.value = version.version;
      AppSnackBar.show(message: '${Texts.to.updateUpdateFound}\n${Texts.to.version.withDoubleDots} $version');
    }
  }

  downloadUpdate() async {
    buttonDownloadUpdateLoading.value = true;
    AppBottomDialogs().withoutButton(title: Texts.to.updateDownloading, form: AppProgressIndicator.linear());
    bool internetStatus = await AppConnectionChecker.to.checkInternet();
    internetStatus ? _downloadUpdateFunction() : noInternetConnectionSnackBar();
    buttonDownloadUpdateLoading.value = false;
  }

  _downloadUpdateFunction() async {
    dlDir = await getExternalStorageDirectory();
    if (dlDir != null) {
      dlFile = File('${dlDir!.path}/${AppTexts.updateAppFilename}');
    }

    if (dlDir != null && dlFile != null) {
      dlFile!.existsSync() ? dlFile!.deleteSync() : null;
      downloaded.value = false;
      String downloadAddress = Texts.to.empty;
      final resultAddress = await UpdateRemoteDataSource().getDownloadAddress();
      resultAddress.fold((l) => showErrorDialog(message: l.toString()), (r) => downloadAddress = r);

      if (downloadAddress.isNotEmpty) {
        final result = await UpdateRemoteDataSource().updateDownload(savePath: dlFile!.path);
        result.fold((l) => showErrorDialog(message: l.toString()), (r) {
          dlFile = r;
          downloaded.value = true;
          appDebugPrint(dlFile?.length());
          AppSnackBar.show(message: Texts.to.updateDownloaded);
          AppAlertDialogs.withOkCancel(
              title: Texts.to.updateInstallationTitle, text: Texts.to.updateInstallationContent, onTapOk: _installUpdateFunction, dismissible: true);
        });
      }
    } else {
      _alertDirectoryOrFileNotFound(dlDir == null);
    }
  }

  void _installUpdateFunction() => dlFile == null ? _alertDirectoryOrFileNotFound(false) : file_plus.OpenFile.open(dlFile!.path);

  _alertDirectoryOrFileNotFound(bool directoryError) => showErrorDialog(
      title: directoryError ? Texts.to.updateDirectoryNotFoundTitle : Texts.to.updateFileNotFoundTitle,
      message: directoryError ? Texts.to.updateDirectoryNotFoundContent : Texts.to.updateFileNotFoundContent);
}
