import 'package:get/get.dart';

import '../di/binding_fixes.dart';
import '../../main.get_put.dart';

/// Application-wide GetX bindings with abstract-type DI fixes.
class AppBindings extends Bindings {
  @override
  void dependencies() {
    GetPutBindings().dependencies();
    applyBindingFixes();
  }
}
