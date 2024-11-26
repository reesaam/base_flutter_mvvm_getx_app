import 'package:flutter/material.dart';

import '../../../ui_kit/theme/themes.dart';

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
  }) =>
      Text(
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
  Text get withBodySmall => copyWith(style: AppThemes.to.textTheme.bodySmall);
  Text get withBodyMedium => copyWith(style: AppThemes.to.textTheme.bodyMedium);
  Text get withBodyLarge => copyWith(style: AppThemes.to.textTheme.bodyLarge);
  Text get withDisplaySmall => copyWith(style: AppThemes.to.textTheme.displaySmall);
  Text get withDisplayMedium => copyWith(style: AppThemes.to.textTheme.displayMedium);
  Text get withDisplayLarge => copyWith(style: AppThemes.to.textTheme.displayLarge);
  Text get withTitleSmall => copyWith(style: AppThemes.to.textTheme.titleSmall);
  Text get withTitleMedium => copyWith(style: AppThemes.to.textTheme.titleMedium);
  Text get withTitleLarge => copyWith(style: AppThemes.to.textTheme.titleLarge);
}

extension ExtensionTextColor on Text {
  Text withColor(Color color) => copyWith(style: style?.copyWith(color: color) ?? TextStyle(color: color));
  Text get withCanvasColor => withColor(AppThemes.to.canvasColor);
  Text get withPrimaryColor => withColor(AppThemes.to.primaryColor);
  Text get withSecondaryColor => withColor(AppThemes.to.colorScheme.secondary);
  Text get withTertiaryColor => withColor(AppThemes.to.colorScheme.tertiary);
  Text get withDisabledColor => withColor(AppThemes.to.disabledColor);
}

extension ExtensionTextSize on Text {
  Text withSize(double fontSize) => copyWith(style: style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize));
  Text get withSizeBodySmall => copyWith(style: style?.copyWith(fontSize: AppThemes.to.textTheme.bodySmall?.fontSize) ?? AppThemes.to.textTheme.bodySmall);
  Text get withSizeBodyMedium => copyWith(style: style?.copyWith(fontSize: AppThemes.to.textTheme.bodyMedium?.fontSize) ?? AppThemes.to.textTheme.bodyMedium);
  Text get withSizeBodyLarge => copyWith(style: style?.copyWith(fontSize: AppThemes.to.textTheme.bodyLarge?.fontSize) ?? AppThemes.to.textTheme.bodyLarge);
  Text get withSizeDisplaySmall => copyWith(style: style?.copyWith(fontSize: AppThemes.to.textTheme.displaySmall?.fontSize) ?? AppThemes.to.textTheme.displaySmall);
  Text get withSizeDisplayMedium => copyWith(style: style?.copyWith(fontSize: AppThemes.to.textTheme.displayMedium?.fontSize) ?? AppThemes.to.textTheme.displayMedium);
  Text get withSizeDisplayLarge => copyWith(style: style?.copyWith(fontSize: AppThemes.to.textTheme.displayLarge?.fontSize) ?? AppThemes.to.textTheme.displayLarge);
  Text get withSizeTitleSmall => copyWith(style: style?.copyWith(fontSize: AppThemes.to.textTheme.titleSmall?.fontSize) ?? AppThemes.to.textTheme.titleSmall);
  Text get withSizeTitleMedium => copyWith(style: style?.copyWith(fontSize: AppThemes.to.textTheme.titleMedium?.fontSize) ?? AppThemes.to.textTheme.titleMedium);
  Text get withSizeTitleLarge => copyWith(style: style?.copyWith(fontSize: AppThemes.to.textTheme.titleLarge?.fontSize) ?? AppThemes.to.textTheme.titleLarge);
}

extension ExtensionTextAlignment on Text {
  Text withTextAlign(TextAlign? align) => copyWith(textAlign: align);
  Text get centered => withTextAlign(TextAlign.center);
  Text get justified => withTextAlign(TextAlign.justify);
}
