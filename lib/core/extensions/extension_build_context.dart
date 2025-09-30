import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension BuildContextData on BuildContext {
  Brightness get brightness => theme.brightness;
}