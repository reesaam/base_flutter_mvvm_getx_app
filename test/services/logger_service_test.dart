import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_elements_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_resources_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/services/logger_service.dart';

class _FakeLoggerService extends CoreService implements LoggerService {
  final List<String> debugs = [];
  final List<String> infos = [];
  final List<String> warnings = [];
  final List<String> errors = [];

  @override
  void debug({required String message}) => debugs.add(message);

  @override
  void info({required String message}) => infos.add(message);

  @override
  void warning({required String message}) => warnings.add(message);

  @override
  void error({required String message, Object? error, StackTrace? stackTrace}) => errors.add(message);

  @override
  Future<void> enableFileSink({File? file}) async {}
}

void main() {
  setUp(() {
    Get.testMode = true;
    Get.reset();
  });

  tearDown(Get.reset);

  test('LoggerService.to is the registered instance', () {
    final logger = _FakeLoggerService();
    Get.put<LoggerService>(logger);

    LoggerService.to.debug(message: 'dev');
    LoggerService.to.info(message: 'hi');
    LoggerService.to.warning(message: 'warn');
    LoggerService.to.error(message: 'err');

    expect(logger.debugs, ['dev']);
    expect(logger.infos, ['hi']);
    expect(logger.warnings, ['warn']);
    expect(logger.errors, ['err']);
  });

  test('debug, info, warning and error do not throw on a real instance', () {
    final logger = LoggerService();
    expect(() => logger.debug(message: 'debug'), returnsNormally);
    expect(() => logger.info(message: 'info'), returnsNormally);
    expect(() => logger.warning(message: 'warn'), returnsNormally);
    expect(() => logger.error(message: 'err'), returnsNormally);
  });

  test('file sink receives info', () {
    final lines = <String>[];
    final logger = LoggerService(fileSink: lines.add);

    logger.info(message: 'hello');
    logger.info(message: 'info-line');

    expect(lines, ['[INFO] hello', '[INFO] info-line']);
  });

  test('minLevel filters debug and info and keeps warning', () {
    final lines = <String>[];
    final logger = LoggerService(minLevel: LoggerLevel.warning, fileSink: lines.add);

    logger.debug(message: 'hidden');
    logger.info(message: 'also-hidden');
    logger.warning(message: 'warn');
    logger.error(message: 'err');

    expect(lines, ['[WARNING] warn', '[ERROR] err']);
  });
}
