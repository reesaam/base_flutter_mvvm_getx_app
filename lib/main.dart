import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'components/notifications/local_notifications/local_notifications.dart';
import 'core/app_localization.dart';
import 'core/core_info/app_info.dart';
import 'core/core_resources/defaults.dart';
import 'core/extensions/extension_for_prints/extension_for_prints.dart';
import 'ui_kit/theme/themes.dart';

import 'main.get_put.dart';

// import 'generated/l10n.dart';

void main() => initProject();

void initProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPutBindings().dependencies();
  await GetStorage.init().withStatusPrint(isLog: true, featureName: 'Get Storage Initialization');
  await AppLocalNotifications().init().withStatusPrint(isLog: true, featureName: 'App Local Notifications Initialization');
  kIsWeb ? null : SystemChannels.textInput.invokeMethod('TextInput.hide');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppInfo.appName,
      initialBinding: GetPutBindings(),
      getPages: GetPutPages.pages,
      initialRoute: GetPutPages.initialRoute.name,
      unknownRoute: GetPutPages.unknownRoute,
      defaultTransition: Transition.fadeIn,
      transitionDuration: appDefaultTransitionDuration,
      color: AppThemes.to.primaryColor,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      supportedLocales: AppLocalization.to.supportedLocales,
      localizationsDelegates: AppLocalization.to.localizationDelegates,
      locale: AppLocalization.to.getLocale(),
      textDirection: AppLocalization.to.getTextDirection(),
    );
  }
}
