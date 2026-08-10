import '../../../barrels/ui_kit_barrel.dart';

extension ExtensionTextCopyWith on Text {
  Text copyWith({
    String? text,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
    Locale? locale,
    Color? selectionColor,
    String? semanticsLabel,
    bool? softWrap,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextHeightBehavior? textHeightBehavior,
    TextScaler? textScaler,
    TextWidthBasis? textWidthBasis,
  }) => Text(
    text ?? data!,
    style: style ?? this.style,
    textAlign: textAlign ?? this.textAlign,
    overflow: overflow ?? this.overflow,
    maxLines: maxLines ?? this.maxLines,
    key: key ?? this.key,
    locale: locale ?? this.locale,
    selectionColor: selectionColor ?? this.selectionColor,
    semanticsLabel: semanticsLabel ?? this.semanticsLabel,
    softWrap: softWrap ?? this.softWrap,
    strutStyle: strutStyle ?? this.strutStyle,
    textDirection: textDirection ?? this.textDirection,
    textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
    textScaler: textScaler ?? this.textScaler,
    textWidthBasis: textWidthBasis ?? this.textWidthBasis,
  );
}

extension ExtensionTextStyle on Text {
  Text withStyle(TextStyle style) => copyWith(style: style);
  Text get withBodySmall => copyWith(style: Get.textTheme.bodySmall);
  Text get withBodyMedium => copyWith(style: Get.textTheme.bodyMedium);
  Text get withBodyLarge => copyWith(style: Get.textTheme.bodyLarge);
  Text get withDisplaySmall => copyWith(style: Get.textTheme.displaySmall);
  Text get withDisplayMedium => copyWith(style: Get.textTheme.displayMedium);
  Text get withDisplayLarge => copyWith(style: Get.textTheme.displayLarge);
  Text get withTitleSmall => copyWith(style: Get.textTheme.titleSmall);
  Text get withTitleMedium => copyWith(style: Get.textTheme.titleMedium);
  Text get withTitleLarge => copyWith(style: Get.textTheme.titleLarge);
}

extension ExtensionTextColor on Text {
  Text withColor(Color? color) => copyWith(
    style: style?.copyWith(color: color) ?? TextStyle(color: color),
  );
  Text get withCanvasColor => withColor(Get.theme.canvasColor);
  Text get withPrimaryColor => withColor(Get.theme.primaryColor);
  Text get withSecondaryColor => withColor(Get.theme.colorScheme.secondary);
  Text get withTertiaryColor => withColor(Get.theme.colorScheme.tertiary);
  Text get withDisabledColor => withColor(Get.theme.disabledColor);
}

extension ExtensionTextSize on Text {
  Text withSize(double fontSize) => copyWith(
    style: style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize),
  );
  Text get withSizeBodySmall => copyWith(style: style?.copyWith(fontSize: Get.textTheme.bodySmall?.fontSize) ?? Get.textTheme.bodySmall);
  Text get withSizeBodyMedium => copyWith(style: style?.copyWith(fontSize: Get.textTheme.bodyMedium?.fontSize) ?? Get.textTheme.bodyMedium);
  Text get withSizeBodyLarge => copyWith(style: style?.copyWith(fontSize: Get.textTheme.bodyLarge?.fontSize) ?? Get.textTheme.bodyLarge);
  Text get withSizeDisplaySmall => copyWith(style: style?.copyWith(fontSize: Get.textTheme.displaySmall?.fontSize) ?? Get.textTheme.displaySmall);
  Text get withSizeDisplayMedium => copyWith(style: style?.copyWith(fontSize: Get.textTheme.displayMedium?.fontSize) ?? Get.textTheme.displayMedium);
  Text get withSizeDisplayLarge => copyWith(style: style?.copyWith(fontSize: Get.textTheme.displayLarge?.fontSize) ?? Get.textTheme.displayLarge);
  Text get withSizeTitleSmall => copyWith(style: style?.copyWith(fontSize: Get.textTheme.titleSmall?.fontSize) ?? Get.textTheme.titleSmall);
  Text get withSizeTitleMedium => copyWith(style: style?.copyWith(fontSize: Get.textTheme.titleMedium?.fontSize) ?? Get.textTheme.titleMedium);
  Text get withSizeTitleLarge => copyWith(style: style?.copyWith(fontSize: Get.textTheme.titleLarge?.fontSize) ?? Get.textTheme.titleLarge);
}

extension ExtensionTextAlignment on Text {
  Text withTextAlign(TextAlign? align) => copyWith(textAlign: align);
  Text get centered => withTextAlign(TextAlign.center);
  Text get justified => withTextAlign(TextAlign.justify);
}
