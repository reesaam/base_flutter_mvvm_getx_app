import 'barrels/core_barrel.dart';
import 'barrels/core_resources_barrel.dart';
import 'barrels/extensions_barrel.dart';
import 'barrels/localization_barrel.dart';
import 'barrels/ui_kit_barrel.dart';

// ignore: barrel_import_lints/only_barrel_imports
import 'main_project_initializer.dart';
// ignore: barrel_import_lints/only_barrel_imports
import 'main.get_put.dart';

Future<void> main() async => await projectInitialization(() async => const MainApp());

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
