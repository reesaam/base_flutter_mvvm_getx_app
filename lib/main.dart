import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'barrels/core_barrel.dart';
import 'barrels/core_resources_barrel.dart';
import 'barrels/extensions_barrel.dart';
import 'barrels/localization_barrel.dart';
import 'barrels/ui_kit_barrel.dart';

import 'main.get_put.dart';
// import 'generated/l10n.dart';

void main() => initProject();

void initProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPutBindings().dependencies();
  // await GetStorage.init().withStatusPrint(isLog: true, featureName: 'Get Storage Initialization');
  // await AppLocalNotifications().init().withStatusPrint(isLog: true, featureName: 'App Local Notifications Initialization');
  // await DeepLinkHandler.init();
  kIsWeb ? null : SystemChannels.textInput.invokeMethod('TextInput.hide');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) => GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: AppInfo.appName,
    initialBinding: GetPutBindings(),
    getPages: GetPutPages.pages,
    initialRoute: GetPutPages.initialRoute.name,
    unknownRoute: GetPutPages.unknownRoute,
    defaultTransition: AppDefaults.transition,
    transitionDuration: AppDefaults.transitionDuration,
    color: AppColors.primary.color,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: ThemeMode.system,
    supportedLocales: AppLocalizations.to.supportedLocales,
    localizationsDelegates: AppLocalizations.to.localizationDelegates,
    locale: AppLocalizations.to.translation?.getLanguage?.locale,
    textDirection: AppLocalizations.to.translation?.getLanguage?.textDirection,
  );
}
