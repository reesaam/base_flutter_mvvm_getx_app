import 'package:flutter/services.dart';

enum AppSystemChannelMethods {
  textInputHide('TextInput.hide');

  final String method;
  const AppSystemChannelMethods(this.method);
}

extension OnAppSystemChannelMethods on AppSystemChannelMethods {
  Future<void> invoke() async => await SystemChannels.textInput.invokeMethod(this.method);
}
