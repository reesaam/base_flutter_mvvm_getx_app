import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../barrels/annotations_barrel.dart';

import '../../barrels/components_barrel.dart';
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
  static final AppLinks _appLinks = AppLinks();

  static String storageKey = AppStorageKeys.deepLink.name;

  /// Internal Variables
  static StreamSubscription<Uri>? _linkSubscription;

  static Future<void> init() async {
    appDebugPrint('initDeepLinks Function');
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uriValue) => _onCallBackFunction(uriValue),
      onError: (error) => _onErrorFunction(error),
      onDone: () => _onDoneListenerFunction(),
      cancelOnError: true,
    );
  }

  static Future<bool> checkStatus() async {
    appDebugPrint('DeepLink Check Status');
    final deepLinkData = await SecureStorageModule.to.read<DeepLinkCallBackUrlData?>(AppStorageKeys.deepLink);
    return deepLinkData.fold(
      (l) => false,
      (r) async {
        appDebugPrint('deepLinkData: ${r?.toJson()}');
        await SecureStorageModule.to.remove(AppStorageKeys.deepLink);
        if (r != null) _handleData(r);
        return true;
      },
    );
  }

  static FutureOr<bool> _onCallBackFunction(Uri uri) async {
    /// Handling DeepLink CallBacks
    appDebugPrint('DeepLink Listener callBack Triggered, uri: ${uri.toString()}');
    final DeepLinkCallBackUrlData? data = DeepLinkHandlerHelper.getDataFromCallBackUrl(uri.toString());
    if (data != null) {
      await SecureStorageModule.to.write(key: AppStorageKeys.deepLink, value: data);
      appDebugPrint('DeepLink Data Wrote to SecureStorage');
      _handleData(data);
    }
    // AppRouter.navigateTo(AppRoutes.home);
    return true;
  }

  static FutureOr<bool> _onErrorFunction(error) async {
    appDebugPrint('DeepLink Error: $error');
    goToPage(AppPages.homepage);
    AppSnackBar.showError(message: Texts.to.error.unknown);
    return true;
  }

  static FutureOr<bool> _onDoneFunction() async {
    appDebugPrint('DefaultOnDoneFunction');
    return true;
  }

  static FutureOr<bool> _onDoneListenerFunction() async {
    appDebugPrint('DefaultListenerOnDoneFunction');
    _linkSubscription?.cancel();
    return true;
  }

  static Future<void> redirect({required String url, Function? onDone, Function? onError, Duration? timeout}) async {
    appDebugPrint('DeepLink Handler Redirecting to $url');
    final bool canLaunchUrl = await canLaunchUrlString(url);
    if (canLaunchUrl) {
      await launchUrlString(url)
          .timeout(AppDefaults.timeOutGeneral)
          .onError((error, stackTrace) => _onErrorFunction(error))
          .whenComplete(() => _onDoneFunction());
      goToPage(AppPages.homepage);
    } else {
      _onErrorFunction('DeepLink Handler Could not launch $url');
    }
  }

  /// Specific [DeepLinkTypes] with specific functionality will handle here
  static void _handleData(DeepLinkCallBackUrlData data) {
    data.type.pageRedirect();
  }
}
