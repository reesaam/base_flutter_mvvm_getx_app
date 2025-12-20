import 'package:flutter/material.dart';

extension OnColorExtension on Color {
  Color get lowOpacity => withAlpha(400);
}