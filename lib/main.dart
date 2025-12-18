import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'components/notifications/local_notifications/local_notifications.dart';
import 'core/core_info/app_info.dart';
import 'core/core_resources/defaults.dart';
import 'core/extensions/data_types_extensions/extension_language.dart';
import 'core/extensions/extension_prints.dart';
import 'localization/localizations.dart';
import 'main.get_put.dart';
import 'ui_kit/theme/themes.dart';

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
      transitionDuration: AppDefaults.transitionDuration,
      color: AppThemes.to.primaryColor,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.to.localizationDelegates,
      locale: AppLocalizations.to.translation?.getLanguage?.locale,
      textDirection: AppLocalizations.to.translation?.getLanguage?.textDirection,
    );
  }
}
