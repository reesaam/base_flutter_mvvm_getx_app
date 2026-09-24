import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../barrels/annotations_barrel.dart';

import '../../barrels/services_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

import 'deep_link_service_data_model/deep_link_service_data_model.dart';
import 'deep_link_service_helper.dart';
import 'deep_link_types.dart';

@GetPut.service()
class DeepLinkService extends CoreService {
  static DeepLinkService get to => Get.find();

  static final AppLinks _appLinks = AppLinks();
  final String storageKey = AppStorageKeys.deepLink.name;

  /// Internal Variables
  StreamSubscription<Uri>? _linkSubscription;

  void init() {
    LoggerService.to.debug(message: 'initDeepLinks Function');
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uriValue) => _onCallBackFunction(uriValue),
      onError: (error) => _onErrorFunction(error),
      onDone: () => _onDoneListenerFunction(),
      cancelOnError: true,
    );
  }

  Future<bool> checkStatus() async {
    LoggerService.to.debug(message: 'DeepLink Check Status');
    final deepLinkData = await SecureStorageService.to.read<DeepLinkServiceCallBackData?>(AppStorageKeys.deepLink);
    return deepLinkData.fold((l) => false, (r) async {
      LoggerService.to.debug(message: 'deepLinkData: ${r?.toJson()}');
      await SecureStorageService.to.remove(AppStorageKeys.deepLink);
      if (r != null) _handleData(r);
      return true;
    });
  }

  FutureOr<bool> _onCallBackFunction(Uri uri) async {
    /// Handling DeepLink CallBacks
    LoggerService.to.debug(message: 'DeepLink Listener callBack Triggered, uri: ${uri.toString()}');
    final DeepLinkServiceCallBackData? data = DeepLinkHandlerHelper.getDataFromCallBackUrl(uri.toString());
    if (data != null) {
      await SecureStorageService.to.write(key: AppStorageKeys.deepLink, value: data);
      LoggerService.to.debug(message: 'DeepLink Data Wrote to SecureStorage');
      _handleData(data);
    }
    // AppRouter.navigateTo(AppRoutes.home);
    return true;
  }

  FutureOr<bool> _onErrorFunction(error) async {
    LoggerService.to.error(message: 'DeepLink Error: $error');
    goToPage(AppPages.homepage);
    AppSnackBar.showError(message: Texts.to.error.unknown);
    return true;
  }

  FutureOr<bool> _onDoneFunction() async {
    LoggerService.to.debug(message: 'DefaultOnDoneFunction');
    return true;
  }

  FutureOr<bool> _onDoneListenerFunction() async {
    LoggerService.to.debug(message: 'DefaultListenerOnDoneFunction');
    _linkSubscription?.cancel();
    return true;
  }

  Future<void> redirect({required String url, Function? onDone, Function? onError, Duration? timeout}) async {
    LoggerService.to.debug(message: 'DeepLink Handler Redirecting to $url');
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
  void _handleData(DeepLinkServiceCallBackData data) {
    data.type.pageRedirect();
  }
}
