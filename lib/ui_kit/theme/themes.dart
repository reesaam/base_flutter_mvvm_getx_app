import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../core/core_resources/defaults.dart';
import '../../core/core_resources/fonts.dart';
import '../resources/elements.dart';
import '../resources/text_sizes.dart';
import 'colors.dart';
import '../../core/extensions/theme_extensions/extension_colors.dart';

@GetPut.component()
class AppThemes {
  ///Main Theme Functions
  static AppThemes get _to => Get.find();
  static ThemeData get to => _to.getTheme();

  static ThemeData get lightTheme => _to.getTheme(brightness: Brightness.light);
  static ThemeData get darkTheme => _to.getTheme(brightness: Brightness.dark);

  ThemeData importTheme({ThemeData? themeData}) => themeData ?? getTheme();

  ///Get Variables and Decide about Theme
  ThemeData getTheme({Brightness? brightness}) {
    // bool? storageResult;
    // AppStorage.to.loadAppData().then((value) => value.fold((l) => null, (r) => storageResult = r?.settings?.darkMode));
    // isDark = storageResult == true || isSystemDark == true;
    // isDark ? appLogPrint('Dark Mode Activated') : null ;
    // return _theme();

    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }

  ///Theme Constructor
  ThemeData _theme() => ThemeData(
        // colorScheme: _colorScheme(),
        canvasColor: AppColors.canvas.color,
        scaffoldBackgroundColor: AppColors.background.color,
        dialogBackgroundColor: AppColors.canvas.color,
        primaryColor: AppColors.primary.color,
        hintColor: AppColors.tertiary.color,
        primaryTextTheme: _textTheme(),
        fontFamily: AppFonts.defaultFont,
        appBarTheme: _appBar(),
        bottomAppBarTheme: _bottomAppBar(),
        drawerTheme: _drawer(),
        bottomNavigationBarTheme: _bottomNavigationBar(),
        navigationBarTheme: _navigationBar(),
        navigationDrawerTheme: _navigationDrawer(),
        navigationRailTheme: _navigationRail(),
        snackBarTheme: _snackBar(),
        dialogTheme: _dialog(),
        bottomSheetTheme: _bottomSheet(),
        floatingActionButtonTheme: _floatingActionButton(),
        bannerTheme: _banner(),
        badgeTheme: _badge(),
        chipTheme: _chip(),
        indicatorColor: _progressIndicator().color,
        progressIndicatorTheme: _progressIndicator(),
        iconTheme: _icon(),
        actionIconTheme: _actionIcon(),
        textTheme: _textTheme(),
        buttonTheme: _button(),
        elevatedButtonTheme: _buttonElevated(),
        outlinedButtonTheme: _buttonOutlined(),
        filledButtonTheme: _buttonFilled(),
        textButtonTheme: _buttonText(),
        iconButtonTheme: _buttonIcon(),
        // buttonBarTheme: _buttonBar(),
        toggleButtonsTheme: _buttonToggle(),
        menuButtonTheme: _buttonMenu(),
        dropdownMenuTheme: _buttonDropDown(),
        cardTheme: _card(),
        cardColor: _card().color,
        checkboxTheme: _checkBox(),
        switchTheme: _switch(),
        dividerTheme: _divider(),
        // tooltipTheme: ,
        // adaptations:
      );

  ///Main Components
  TextTheme _textTheme() {
    TextStyle generalStyle = _textStyle();

    TextStyle style = generalStyle.copyWith(
      color: AppColors.secondary.color,
    );

    TextTheme textTheme = TextTheme(
      bodySmall: style.copyWith(fontSize: AppTextSizes.textSizeXSmall),
      bodyMedium: style.copyWith(fontSize: AppTextSizes.textSizeSmall),
      bodyLarge: style.copyWith(fontSize: AppTextSizes.textSizeNormal),
      displaySmall: style.copyWith(fontSize: AppTextSizes.textSizeNormal),
      displayMedium: style.copyWith(fontSize: AppTextSizes.textSizeLarge),
      displayLarge: style.copyWith(fontSize: AppTextSizes.textSizeXLarge),
      titleSmall: style.copyWith(fontSize: AppTextSizes.textSizeTitle),
      titleMedium: style.copyWith(fontSize: AppTextSizes.textSizeTitleLarge),
      titleLarge: style.copyWith(fontSize: AppTextSizes.textSizeTitleHuge),
    );
    return textTheme;
  }

  AppBarTheme _appBar() => AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.appBarBackground.color,
        foregroundColor: AppColors.appBarForeground.color,
      );

  BottomAppBarTheme _bottomAppBar() => BottomAppBarTheme(
        elevation: 5,
        color: AppColors.primary.color,
      );

  DrawerThemeData _drawer() => DrawerThemeData(
        elevation: 5,
        backgroundColor: AppColors.appBarBackground.color,
      );

  BottomNavigationBarThemeData _bottomNavigationBar() {
    IconThemeData defaultIconThemeData = const IconThemeData();

    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary.color,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: true,
      selectedIconTheme: defaultIconThemeData,
      unselectedIconTheme: defaultIconThemeData,
      selectedItemColor: AppColors.primary.color,
      unselectedItemColor: AppColors.primary.color,
    );
  }

  NavigationBarThemeData _navigationBar() => NavigationBarThemeData(
        backgroundColor: AppColors.background.color,
      );

  NavigationDrawerThemeData _navigationDrawer() => NavigationDrawerThemeData(
        backgroundColor: AppColors.background.color,
      );

  NavigationRailThemeData _navigationRail() => NavigationRailThemeData(
        backgroundColor: AppColors.background.color,
      );

  SnackBarThemeData _snackBar() => SnackBarThemeData(
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.tertiary.color,
      );

  DialogTheme _dialog() => DialogTheme(
        elevation: 10,
        backgroundColor: AppColors.background.color,
      );

  BottomSheetThemeData _bottomSheet() => BottomSheetThemeData(backgroundColor: AppColors.background.color);

  FloatingActionButtonThemeData _floatingActionButton() => FloatingActionButtonThemeData(
        backgroundColor: AppColors.secondary.color,
      );

  MaterialBannerThemeData _banner() => MaterialBannerThemeData();

  BadgeThemeData _badge() => BadgeThemeData();

  ChipThemeData _chip() => ChipThemeData();

  ProgressIndicatorThemeData _progressIndicator() => ProgressIndicatorThemeData();

  IconThemeData _icon() => IconThemeData();

  ActionIconThemeData _actionIcon() => ActionIconThemeData();

  ///Text
  TextStyle _textStyle() => TextStyle(
        fontSize: appDefaultFontSize,
        overflow: TextOverflow.ellipsis,
      );

  ///Buttons
  ButtonThemeData _button() => ButtonThemeData(
        buttonColor: AppColors.buttonColor.color,
        disabledColor: AppColors.buttonDisabled.color,
      );

  TextStyle _buttonTextStyle() => TextStyle(
        fontSize: appDefaultFontSize,
        overflow: TextOverflow.ellipsis,
      );

  ButtonStyle _buttonStyle() => ButtonStyle(
        shape: WidgetStateProperty.all(AppElements.borderShapeDefault),
        textStyle: WidgetStateProperty.all(_buttonTextStyle()),
      );

  ElevatedButtonThemeData _buttonElevated() {
    ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primary.color),
      foregroundColor: WidgetStateProperty.all(AppColors.background.color),
    );

    return ElevatedButtonThemeData(style: buttonStyle);
  }

  OutlinedButtonThemeData _buttonOutlined() => OutlinedButtonThemeData(style: _buttonStyle());

  FilledButtonThemeData _buttonFilled() => FilledButtonThemeData(style: _buttonStyle());

  TextButtonThemeData _buttonText() => TextButtonThemeData(style: _buttonStyle());

  IconButtonThemeData _buttonIcon() => IconButtonThemeData(style: _buttonStyle());

  OverflowBar _overflowBar() => const OverflowBar();

  ToggleButtonsThemeData _buttonToggle() => ToggleButtonsThemeData();

  MenuButtonThemeData _buttonMenu() => MenuButtonThemeData(style: _buttonStyle());

  ///Menus
  DropdownMenuThemeData _buttonDropDown() => const DropdownMenuThemeData();

  ///Others
  CardTheme _card() => CardTheme(
        shape: AppElements.borderShapeDefault,
        color: AppColors.background.color,
      );

  CheckboxThemeData _checkBox() => CheckboxThemeData(
        checkColor: WidgetStateProperty.all(AppColors.background.color),
        fillColor: WidgetStateProperty.all(AppColors.primary.color),
        // side: AppElements.borderSide,
      );

  SwitchThemeData _switch() => SwitchThemeData(
        overlayColor: WidgetStateProperty.all(AppColors.background.color),
        trackOutlineColor: WidgetStateProperty.all(AppColors.primary.color),
        thumbColor: WidgetStateProperty.all(AppColors.background.color),
      );

  DividerThemeData _divider() => DividerThemeData(
        color: AppColors.secondary.color,
      );
}
