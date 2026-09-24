import 'dart:convert';
import 'dart:io';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';

import '../barrels/annotations_barrel.dart';
import '../barrels/core_barrel.dart';
import '../barrels/core_elements_barrel.dart';
import '../barrels/core_resources_barrel.dart';
import '../barrels/extensions_barrel.dart';
import '../barrels/services_barrel.dart';
import '../barrels/shared_models_barrel.dart';

@GetPut.component()
class AppFileFunctions extends CoreComponent {
  static AppFileFunctions get to => Get.find();

  Future<String?> saveFile({required String fileName, required data, String? filePath}) async {
    SaveFileDialogParams saveParams = SaveFileDialogParams(data: data, fileName: fileName, sourceFilePath: filePath);
    String? path = await FlutterFileDialog.saveFile(params: saveParams);
    LoggerService.to.info(message: 'File Saved');
    LoggerService.to.debug(message: 'Filename: ${saveParams.fileName}');
    LoggerService.to.debug(message: 'Source Path: ${saveParams.sourceFilePath}');
    LoggerService.to.info(message: 'File Path: $path');
    return path;
  }

  Future<File?> pickFile({OpenFileDialogType? dialogType, SourceType? sourceType, List<String>? fileExtensionsFilter}) async {
    File? importFile;
    OpenFileDialogParams openFileParams = OpenFileDialogParams(
      dialogType: dialogType ?? OpenFileDialogType.document,
      fileExtensionsFilter: fileExtensionsFilter,
    );
    String? importFilePath = await FlutterFileDialog.pickFile(params: openFileParams);
    if (importFilePath != null) {
      importFile = File(importFilePath);
    }
    return importFile;
  }

  Future<void> exportAppData() async {
    final result = await AppStorageService.to.loadAppData();
    await result.fold((_) async {}, (appData) async {
      if (appData == null) {
        LoggerService.to.warning(message: 'Exported AppData was Null');
        return;
      }
      final data = appData.toJson().toString().toUInt8List();
      final savedPath = await saveFile(fileName: AppTexts.settingBackupFilename, data: data);
      LoggerService.to.info(message: 'File Path: $savedPath');
      LoggerService.to.info(message: 'Backup File Exported');
    });
  }

  Future<void> importAppData() async {
    final appDataFile = await pickFile();
    if (appDataFile == null) {
      LoggerService.to.warning(message: 'Imported File was NUll');
      return;
    }

    final appData = AppData.fromJson(json.decode(String.fromCharCodes(appDataFile.readAsBytesSync())));
    if (appData.dataVersion != AppDataVersions.values.last) {
      LoggerService.to.warning(message: 'Data Version is not Compatible, Converter is not Implemented\nData Import Failed');
      return;
    }

    await AppStorageService.to.saveAppData(appData: appData);
    LoggerService.to.info(message: 'Data Imported');
  }
}
