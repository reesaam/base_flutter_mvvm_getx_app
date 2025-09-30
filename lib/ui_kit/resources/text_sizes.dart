import '../../core/core_resources/defaults.dart';

class AppTextSizes {
  static double get _textSizeDefault => appDefaultFontSize;

  static double get textSizeXSmall => _textSizeDefault - 4;
  static double get textSizeSmall => _textSizeDefault - 2;
  static double get textSizeNormal => _textSizeDefault;
  static double get textSizeLarge => _textSizeDefault + 3;
  static double get textSizeXLarge => _textSizeDefault + 5;
  static double get textSizeTitle => _textSizeDefault + 8;
  static double get textSizeTitleLarge => _textSizeDefault + 14;
  static double get textSizeTitleHuge => _textSizeDefault + 20;
  static double get textSizeHeadlineSmall => _textSizeDefault + 20;
  static double get textSizeHeadlineMedium => _textSizeDefault + 30;
  static double get textSizeHeadlineLarge => _textSizeDefault + 40;
  static double get textSizeLabelSmall => _textSizeDefault + 10;
  static double get textSizeLabelMedium => _textSizeDefault + 20;
  static double get textSizeLabelLarge => _textSizeDefault + 25;
}