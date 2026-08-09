// Smoke test replaced — full bootstrap requires platform channels.
// Prefer component/ui_kit unit tests under test/.

import 'package:base_flutter_mvvm_getx_app/barrels/core_barrel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('project env config is loadable', () {
    expect(EnvConfig.envName, isNotEmpty);
  });
}
