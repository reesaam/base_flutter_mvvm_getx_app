import 'dart:async';

import 'barrels/components_barrel.dart';
import 'barrels/core_barrel.dart';
import 'barrels/core_resources_barrel.dart';
import 'barrels/extensions_barrel.dart';
import 'barrels/localization_barrel.dart';
import 'barrels/ui_kit_barrel.dart';

// ignore: barrel_import_lints/only_barrel_imports
import 'package:flutter/foundation.dart';
// ignore: barrel_import_lints/only_barrel_imports
import 'package:get_storage/get_storage.dart';
// ignore: barrel_import_lints/only_barrel_imports
import 'main.get_put.dart';

Future<void> main()  async {
  await runZonedGuarded(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      GetPutBindings().dependencies();
      // FlutterError.onError = (details) => unawaited();
      EnvironmentHandler.applyEnvConfig();
      await GetStorage.init();
      //await AuthSession.to.restoreSession();
      if (!kIsWeb) await AppSystemChannelMethods.textInputHide.invoke();
      runApp(const MainApp());
    },
        (error, stack) {
      // unawaited(CrashReporter.recordError(error, stack, fatal: true));
      appLogPrint('Uncaught zone error: $error\n$stack');
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: AppInfo.appName,
    initialBinding: GetPutBindings(),
    getPages: GetPutPages.pages,
    initialRoute: GetPutPages.initialRoute,
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
