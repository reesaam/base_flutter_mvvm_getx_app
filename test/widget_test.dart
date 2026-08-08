// Smoke test replaced — full bootstrap requires platform channels.
// Prefer component/ui_kit unit tests under test/.

import 'package:flutter_test/flutter_test.dart';
import 'package:base_flutter_mvvm_getx_app/app/flavors/env_config.dart';

void main() {
  test('project env config is loadable', () {
    expect(EnvConfig.envName, isNotEmpty);
  });
}
