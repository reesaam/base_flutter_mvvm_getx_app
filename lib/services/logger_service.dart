import 'dart:io';

import '../barrels/annotations_barrel.dart';
import '../barrels/core_barrel.dart';
import '../barrels/core_elements_barrel.dart';
import '../barrels/core_resources_barrel.dart';
import '../barrels/localization_barrel.dart';

// ignore: barrel_import_lints/only_barrel_imports
import 'package:flutter/foundation.dart';
// ignore: barrel_import_lints/only_barrel_imports
import 'package:path_provider/path_provider.dart';
// ignore: barrel_import_lints/only_barrel_imports
import 'package:sentry_flutter/sentry_flutter.dart';


@GetPut.service()
class LoggerService extends CoreService {
  /// [minLevel] drops noisier lines. [fileSink] is an optional extra writer (tests or a custom file).
  LoggerService({LoggerLevel? minLevel, void Function(String line)? fileSink})
    : _minLevel = minLevel,
      _fileSink = fileSink;

  static LoggerService get to => Get.find();

  final LoggerLevel? _minLevel;
  void Function(String line)? _fileSink;

  /// Release defaults to warning so debug/info do not flood production.
  LoggerLevel get _effectiveMinLevel => _minLevel ?? (CoreFlags.isRelease ? LoggerLevel.warning : LoggerLevel.debug);

  void debug({required String message}) => _logger(level: LoggerLevel.debug, message: message);
  void info({required String message}) => _logger(level: LoggerLevel.info, message: message);
  void warning({required String message}) => _logger(level: LoggerLevel.warning, message: message);
  void error({required String message, Object? error, StackTrace? stackTrace}) => _logger(level: LoggerLevel.error, message: message, error: error, stackTrace: stackTrace);

  /// Optional disk log. Skipped on web; [file] overrides the default `app.log` in documents.
  Future<void> enableFileSink({File? file}) async {
    if (kIsWeb) return;
    final logFile = file ?? File('${(await getApplicationDocumentsDirectory()).path}/app.log');
    _fileSink = (line) => logFile.writeAsStringSync('$line\n', mode: FileMode.append, flush: true);
  }

  /// Main Logger Function
  void _logger({required LoggerLevel level, String? message, Object? error, StackTrace? stackTrace}) {
    if (level.index < _effectiveMinLevel.index) return;
    final prefix = '[${level.name.toUpperCase()}]';
    var msg = '$prefix ${message ?? Texts.to.error.unknown}';
    if (error != null) msg = '$msg · $error';
    _writeConsole(msg);
    _fileSink?.call(msg);
    _addSentryBreadcrumb(level: level, message: msg);
  }

  /// No `print` and no console in release — avoids leaking internals and log noise in stores.
  void _writeConsole(String msg) {
    if (CoreFlags.isRelease) return;
    debugPrint(msg);
  }

  /// Trail for the next crash report. No-op until Sentry is enabled via env config.
  void _addSentryBreadcrumb({required LoggerLevel level, required String message}) {
    if (!EnvConfig.shouldInitSentry) return;
    try {
      Sentry.addBreadcrumb(
        Breadcrumb(
          message: message,
          category: 'logger',
          level: switch (level) {
            LoggerLevel.debug => SentryLevel.debug,
            LoggerLevel.info => SentryLevel.info,
            LoggerLevel.warning => SentryLevel.warning,
            LoggerLevel.error => SentryLevel.error,
          },
        ),
      );
    } catch (_) {
      // Logging must never throw if Sentry is not started or rejects the breadcrumb.
    }
  }
}
