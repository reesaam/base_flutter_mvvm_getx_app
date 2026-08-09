import 'dart:async';

import 'package:sentry_flutter/sentry_flutter.dart';

import '../../barrels/core_barrel.dart';

/// Abstracts crash/error reporting so the app can run without Sentry.
class CrashReporter {
  CrashReporter._();

  static bool _initialized = false;

  static bool get isEnabled => _initialized && EnvConfig.shouldInitSentry;

  static Future<void> initSentry(FutureOr<void> Function() appRunner) async {
    if (!EnvConfig.shouldInitSentry) {
      _initialized = false;
      await appRunner();
      return;
    }

    await SentryFlutter.init(
      (options) {
        options.dsn = EnvConfig.sentryDsn;
        options.environment = EnvConfig.envName;
        options.release = '${AppInfo.appNameInitials}@${AppInfo.currentVersion.version}';
        options.tracesSampleRate = EnvConfig.isProduction ? 0.2 : 1.0;
        options.sendDefaultPii = false;
        options.enableAutoSessionTracking = true;
      },
      appRunner: () async {
        _initialized = true;
        await appRunner();
      },
    );
  }

  static Future<void> recordError(
    Object error,
    StackTrace? stackTrace, {
    String? hint,
    bool fatal = false,
  }) async {
    appLogPrint('CrashReporter: $error');
    if (!isEnabled) return;
    await Sentry.captureException(
      error,
      stackTrace: stackTrace,
      hint: hint == null ? null : Hint.withMap({'message': hint}),
      withScope: (scope) {
        scope.level = fatal ? SentryLevel.fatal : SentryLevel.error;
      },
    );
  }

  static Future<void> recordFlutterError(FlutterErrorDetails details) async {
    FlutterError.presentError(details);
    await recordError(
      details.exception,
      details.stack,
      hint: details.context?.toString(),
      fatal: true,
    );
  }

  static Future<void> addBreadcrumb(String message, {String? category}) async {
    if (!isEnabled) return;
    await Sentry.addBreadcrumb(
      Breadcrumb(
        message: message,
        category: category ?? 'app',
        level: SentryLevel.info,
      ),
    );
  }

  static Future<void> setUser({String? id, String? email, String? username}) async {
    if (!isEnabled) return;
    await Sentry.configureScope((scope) {
      scope.setUser(SentryUser(id: id, email: email, username: username));
    });
  }

  static Future<void> clearUser() async {
    if (!isEnabled) return;
    await Sentry.configureScope((scope) => scope.setUser(null));
  }
}
