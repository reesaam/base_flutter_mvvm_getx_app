import 'package:uuid/uuid.dart';

import '../../barrels/annotations_barrel.dart';
import '../../barrels/core_elements_barrel.dart';

@GetPut.component()
class UuidHandler extends CoreComponent {

  static String generate() {
    var uuid = Uuid();
    String generatedUuid = uuid.v1();
    return generatedUuid;
  }
}