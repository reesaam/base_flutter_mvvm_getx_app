import 'dart:typed_data';

import 'package:uuid/uuid.dart';

import '../barrels/annotations_barrel.dart';
import '../barrels/core_barrel.dart';
import '../barrels/core_elements_barrel.dart';

@GetPut.component()
class UuidHandler extends CoreComponent {
  static UuidHandler get to => Get.find();
  static Uuid get _uuid => Uuid();

  static String generate() => _uuid.v8();

  static bool isValid({String? fromString, Uint8List? fromByteList}) => Uuid.isValidUUID(fromString: fromString ?? '', fromByteList: fromByteList);
}
