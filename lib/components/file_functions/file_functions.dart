import 'dart:io';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_functions.dart';

@GetPut.component()
class AppFileFunctions {
  static AppFileFunctions get to => Get.find();

  Future<String?> saveFile({
    required String fileName,
    required data,
    String? filePath,
  }) async {
    SaveFileDialogParams saveParams = SaveFileDialogParams(data: data, fileName: fileName, sourceFilePath: filePath);
    String? path = await FlutterFileDialog.saveFile(params: saveParams);
    appLogPrint('File Saved');
    appDebugPrint('Filename: ${saveParams.fileName}');
    appDebugPrint('Path: ${saveParams.sourceFilePath}');
    appLogPrint('File Path: $path');
    return path;
  }

  Future<File?> pickFile({
    OpenFileDialogType? dialogType,
    SourceType? sourceType,
    List<String>? fileExtensionsFilter,
  }) async {
    File? importFile;
    OpenFileDialogParams openFileParams = OpenFileDialogParams(
      dialogType: dialogType ?? OpenFileDialogType.document,
      fileExtensionsFilter: fileExtensionsFilter,
    );
    String? importFilePath = await FlutterFileDialog.pickFile(params: openFileParams);
    if (importFilePath != null) {
      importFile = File(importFilePath);
    }
    // String stringData = String.fromCharCodes(importFile.readAsBytesSync());
    // var jsonData = json.decode(stringData);
    return importFile;
  }
}
