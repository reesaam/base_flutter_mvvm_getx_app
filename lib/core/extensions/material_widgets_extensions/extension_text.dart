import '../../../barrels/ui_kit_barrel.dart';

extension ExtensionTextCopyWith on Text {
  Text copyWith({
    String? text,
    TextStyle? style,
    AppColors? textColor,
    AppColors? backgroundColor,
    double? fontSize,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
    Locale? locale,
    AppColors? selectionColor,
    String? semanticsLabel,
    bool? softWrap,
    StrutStyle? strutStyle,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
    TextDirection? textDirection,
    TextHeightBehavior? textHeightBehavior,
    TextScaler? textScaler,
    double? letterSpacing,
    TextWidthBasis? textWidthBasis,
  }) => Text(
    text ?? data ?? '',
    style: (style ?? this.style ?? TextStyle()).copyWith(
      color: textColor?.color,
      fontSize: fontSize,
      backgroundColor: backgroundColor?.color,
      decoration: decoration,
      decorationStyle: decorationStyle,
      letterSpacing: letterSpacing,
    ),
    textAlign: textAlign ?? this.textAlign,
    overflow: overflow ?? this.overflow,
    maxLines: maxLines ?? this.maxLines,
    key: key ?? this.key,
    locale: locale ?? this.locale,
    selectionColor: selectionColor?.color ?? this.selectionColor,
    semanticsLabel: semanticsLabel ?? this.semanticsLabel,
    softWrap: softWrap ?? this.softWrap,
    strutStyle: strutStyle ?? this.strutStyle,
    textDirection: textDirection ?? this.textDirection,
    textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
    textScaler: textScaler ?? this.textScaler,
    textWidthBasis: textWidthBasis ?? this.textWidthBasis,
  );
}

extension ExtensionTextTheme on Text {
  // Text Theme Styles
  Text get withBodySmallTheme => copyWith(style: Get.textTheme.bodySmall);
  Text get withBodyMediumTheme => copyWith(style: Get.textTheme.bodyMedium);
  Text get withBodyLargeTheme => copyWith(style: Get.textTheme.bodyLarge);
  Text get withDisplaySmallTheme => copyWith(style: Get.textTheme.displaySmall);
  Text get withDisplayMediumTheme => copyWith(style: Get.textTheme.displayMedium);
  Text get withDisplayLargeTheme => copyWith(style: Get.textTheme.displayLarge);
  Text get withTitleSmallTheme => copyWith(style: Get.textTheme.titleSmall);
  Text get withTitleMediumTheme => copyWith(style: Get.textTheme.titleMedium);
  Text get withTitleLargeTheme => copyWith(style: Get.textTheme.titleLarge);

  // Text Theme Sizes
  Text get withBodySmallSize => copyWith(fontSize: Get.textTheme.bodySmall?.fontSize);
  Text get withBodyMediumSize => copyWith(fontSize: Get.textTheme.bodyMedium?.fontSize);
  Text get withBodyLargeSize => copyWith(fontSize: Get.textTheme.bodyLarge?.fontSize);
  Text get withDisplaySmallSize => copyWith(fontSize: Get.textTheme.displaySmall?.fontSize);
  Text get withDisplayMediumSize => copyWith(fontSize: Get.textTheme.displayMedium?.fontSize);
  Text get withDisplayLargeSize => copyWith(fontSize: Get.textTheme.displayLarge?.fontSize);
  Text get withTitleSmallSize => copyWith(fontSize: Get.textTheme.titleSmall?.fontSize);
  Text get withTitleMediumSize => copyWith(fontSize: Get.textTheme.titleMedium?.fontSize);
  Text get withTitleLargeSize => copyWith(fontSize: Get.textTheme.titleLarge?.fontSize);
}

extension ExtensionTextAlignment on Text {
  Text withTextAlign(TextAlign? align) => copyWith(textAlign: align);

  Text get centered => withTextAlign(TextAlign.center);

  Text get justified => withTextAlign(TextAlign.justify);
}
