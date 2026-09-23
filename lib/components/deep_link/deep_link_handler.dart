import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:rename/platform_file_editors/abs_platform_file_editor.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../barrels/annotations_barrel.dart';

import '../../barrels/services_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

import 'deep_link_handler_data_model/deep_link_handler_data_model.dart';
import 'deep_link_handler_helper.dart';
import 'deep_link_types.dart';

@GetPut.component()
class DeepLinkHandler extends CoreComponent {
  static DeepLinkHandler get to => Get.find();

  static final AppLinks _appLinks = AppLinks();
  final String storageKey = AppStorageKeys.deepLink.name;

  /// Internal Variables
  StreamSubscription<Uri>? _linkSubscription;

  void init() {
    LoggerService.to.devLog(message: 'initDeepLinks Function');
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uriValue) => _onCallBackFunction(uriValue),
      onError: (error) => _onErrorFunction(error),
      onDone: () => _onDoneListenerFunction(),
      cancelOnError: true,
    );
  }

  Future<bool> checkStatus() async {
    LoggerService.to.devLog(message: 'DeepLink Check Status');
    final deepLinkData = await SecureStorageService.to.read<DeepLinkCallBackUrlData?>(AppStorageKeys.deepLink);
    return deepLinkData.fold((l) => false, (r) async {
      LoggerService.to.devLog(message: 'deepLinkData: ${r?.toJson()}');
      await SecureStorageService.to.remove(AppStorageKeys.deepLink);
      if (r != null) _handleData(r);
      return true;
    });
  }

  FutureOr<bool> _onCallBackFunction(Uri uri) async {
    /// Handling DeepLink CallBacks
    LoggerService.to.devLog(message: 'DeepLink Listener callBack Triggered, uri: ${uri.toString()}');
    final DeepLinkCallBackUrlData? data = DeepLinkHandlerHelper.getDataFromCallBackUrl(uri.toString());
    if (data != null) {
      await SecureStorageService.to.write(key: AppStorageKeys.deepLink, value: data);
      LoggerService.to.devLog(message: 'DeepLink Data Wrote to SecureStorage');
      _handleData(data);
    }
    // AppRouter.navigateTo(AppRoutes.home);
    return true;
  }

  FutureOr<bool> _onErrorFunction(error) async {
    LoggerService.to.devLog(message: 'DeepLink Error: $error');
    goToPage(AppPages.homepage);
    AppSnackBar.showError(message: Texts.to.error.unknown);
    return true;
  }

  FutureOr<bool> _onDoneFunction() async {
    LoggerService.to.devLog(message: 'DefaultOnDoneFunction');
    return true;
  }

  FutureOr<bool> _onDoneListenerFunction() async {
    LoggerService.to.devLog(message: 'DefaultListenerOnDoneFunction');
    _linkSubscription?.cancel();
    return true;
  }

  Future<void> redirect({required String url, Function? onDone, Function? onError, Duration? timeout}) async {
    LoggerService.to.devLog(message: 'DeepLink Handler Redirecting to $url');
    final bool canLaunchUrl = await canLaunchUrlString(url);
    if (canLaunchUrl) {
      await launchUrlString(
        url,
      ).timeout(AppDefaults.timeOutGeneral).onError((error, stackTrace) => _onErrorFunction(error)).whenComplete(() => _onDoneFunction());
      goToPage(AppPages.homepage);
    } else {
      _onErrorFunction('DeepLink Handler Could not launch $url');
    }
  }

  /// Specific [DeepLinkTypes] with specific functionality will handle here
  void _handleData(DeepLinkCallBackUrlData data) {
    data.type.pageRedirect();
  }
}
