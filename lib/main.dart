import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'components/deep_link_handler/deep_link_handler.dart';
import 'core/core_info/app_info.dart';
import 'core/core_resources/defaults.dart';
import 'core/extensions/data_types_extensions/extension_language.dart';
import 'core/extensions/theme_extensions/extension_colors.dart';
import 'localization/localizations.dart';

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
