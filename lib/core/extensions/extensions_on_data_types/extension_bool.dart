import 'package:get/get.dart';

extension ExtensionRxFunctions on Rx<bool> {
  get invert => value = !value;
  get clear => value = false;
}

extension ExtensionFunctions on bool {
  get invert => !this;
  get clear => false;
}

extension ExtensionRxFunctionsNull on Rx<bool?> {
  get invert => value = value == true ? false : true;
  get clear => value = false;
}

extension ExtensionFunctionsNull on bool? {
  get invert => this == true ? false : true;
  get clear => null;
}
