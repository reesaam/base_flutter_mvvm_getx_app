// ignore_for_file: barrel_import_lints/only_barrel_imports

import 'dart:async';

import 'barrels/components_barrel.dart';
import 'barrels/core_barrel.dart';
import 'barrels/core_resources_barrel.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'features/auth/data/auth_session.dart';

Future<void> projectInitialization(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (details) => unawaited(CrashReporter.recordFlutterError(details));

      PlatformDispatcher.instance.onError = (error, stack) {
        unawaited(CrashReporter.recordError(error, stack, fatal: true));
        return true;
      };

      EnvironmentHandler.applyEnvConfig();

      await CrashReporter.initSentry(() async {
        await _initializeDependencies();
        final app = await builder();
        runApp(app);
      });
    },
    (error, stack) {
      unawaited(CrashReporter.recordError(error, stack, fatal: true));
      appLogPrint('Uncaught zone error: $error\n$stack');
    },
  );
}

Future<void> _initializeDependencies() async {
  await GetStorage.init().catchError((Object e, StackTrace st) {
    appLogPrint('GetStorage init failed: $e');
    return false;
  });

  try {
    await SecureStorageModule.to.init(EnvConfig.secureStoragePassword);
  } catch (e, st) {
    appLogPrint('SecureStorage init failed: $e');
    await CrashReporter.recordError(e, st, hint: 'secure_storage_init');
  }

  try {
    await AuthSession.to.restoreSession();
  } catch (e, st) {
    appLogPrint('Auth session restore failed: $e');
    await CrashReporter.recordError(e, st, hint: 'auth_session_restore');
  }

  if (!kIsWeb) await AppSystemChannelMethods.textInputHide.invoke();
}
