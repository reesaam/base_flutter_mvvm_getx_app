import '../../barrels/core_resources_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class AppTheme {
  ///Main Theme Functions
  static ThemeData get lightTheme => _getTheme(brightness: Brightness.light);
  static ThemeData get darkTheme => _getTheme(brightness: Brightness.dark);

  ThemeData importTheme({ThemeData? themeData}) => themeData ?? _getTheme();

  ///Get Variables and Decide about Theme
  static ThemeData _getTheme({Brightness? brightness}) {
    // bool? storageResult;
    // AppStorage.to.loadAppData().then((value) => value.fold((l) => null, (r) => storageResult = r?.settings?.darkMode));
    // isDark = storageResult == true || isSystemDark == true;
    // isDark ? appLogPrint('Dark Mode Activated') : null ;
    // return _theme();

    // Get.changeThemeMode(brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light);
    return _theme();
  }

  ///Theme Constructor
  static ThemeData _theme() => ThemeData(
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
        cardTheme: _card().data,
        cardColor: _card().color,
        checkboxTheme: _checkBox(),
        switchTheme: _switch(),
        dividerTheme: _divider(),
        // tooltipTheme: ,
        // adaptations:
      );

  ///Main Components
  static TextTheme _textTheme() {
    TextStyle generalStyle = _textStyle();

    TextStyle style = generalStyle.copyWith(
      color: AppColors.onPrimary.color,
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

  static AppBarTheme _appBar() => AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.appBarBackground.color,
        foregroundColor: AppColors.appBarForeground.color,
      );

  static BottomAppBarThemeData _bottomAppBar() => BottomAppBarThemeData(
        elevation: 5,
        color: AppColors.primary.color,
      );

  static DrawerThemeData _drawer() => DrawerThemeData(
        elevation: 5,
        backgroundColor: AppColors.appBarBackground.color,
      );

  static BottomNavigationBarThemeData _bottomNavigationBar() {
    IconThemeData defaultIconThemeData = const IconThemeData();

    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavigationBarBackground.color,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: true,
      selectedIconTheme: defaultIconThemeData,
      unselectedIconTheme: defaultIconThemeData,
      selectedItemColor: AppColors.primary.color,
      unselectedItemColor: AppColors.primary.color,
    );
  }

  static NavigationBarThemeData _navigationBar() => NavigationBarThemeData(
        backgroundColor: AppColors.primary.color,
      );

  static NavigationDrawerThemeData _navigationDrawer() => NavigationDrawerThemeData(
        backgroundColor: AppColors.primary.color,
      );

  static NavigationRailThemeData _navigationRail() => NavigationRailThemeData(
        backgroundColor: AppColors.primary.color,
      );

  static SnackBarThemeData _snackBar() => SnackBarThemeData(
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.tertiary.color,
      );

  static DialogThemeData _dialog() => DialogThemeData();

  static BottomSheetThemeData _bottomSheet() => BottomSheetThemeData(backgroundColor: AppColors.background.color);

  static FloatingActionButtonThemeData _floatingActionButton() => FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary.color,
      );

  static MaterialBannerThemeData _banner() => MaterialBannerThemeData();

  static BadgeThemeData _badge() => BadgeThemeData();

  static ChipThemeData _chip() => ChipThemeData();

  static ProgressIndicatorThemeData _progressIndicator() => ProgressIndicatorThemeData();

  static IconThemeData _icon() => IconThemeData();

  static ActionIconThemeData _actionIcon() => ActionIconThemeData();

  ///Text
  static TextStyle _textStyle() => TextStyle(
        fontSize: AppDefaults.fontSize,
        overflow: TextOverflow.ellipsis,
      );

  ///Buttons
  static ButtonThemeData _button() => ButtonThemeData(
        buttonColor: AppColors.button.color,
        disabledColor: AppColors.buttonDisabled.color,
      );

  static TextStyle _buttonTextStyle() => TextStyle(
        fontSize: AppDefaults.fontSize,
        overflow: TextOverflow.ellipsis,
      );

  static ButtonStyle _buttonStyle() => ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.button.color),
        foregroundColor: WidgetStateProperty.all(AppColors.buttonText.color),
        shape: WidgetStateProperty.all(AppElements.borderShapeDefault),
        textStyle: WidgetStateProperty.all(_buttonTextStyle()),
      );

  static ElevatedButtonThemeData _buttonElevated() => ElevatedButtonThemeData(style: _buttonStyle());

  static OutlinedButtonThemeData _buttonOutlined() => OutlinedButtonThemeData(style: _buttonStyle());

  static FilledButtonThemeData _buttonFilled() => FilledButtonThemeData(style: _buttonStyle());

  static TextButtonThemeData _buttonText() => TextButtonThemeData(style: _buttonStyle());

  static IconButtonThemeData _buttonIcon() => IconButtonThemeData(style: _buttonStyle().invertColors);

  static OverflowBar _overflowBar() => const OverflowBar();

  static ToggleButtonsThemeData _buttonToggle() => const ToggleButtonsThemeData();

  static MenuButtonThemeData _buttonMenu() => MenuButtonThemeData(style: _buttonStyle());

  ///Menus
  static DropdownMenuThemeData _buttonDropDown() => const DropdownMenuThemeData();

  ///Others
  static CardTheme _card() => CardTheme(
        shape: AppElements.borderShapeDefault,
        color: AppColors.background.color,
      );

  static CheckboxThemeData _checkBox() => CheckboxThemeData(
        checkColor: WidgetStateProperty.all(AppColors.background.color),
        fillColor: WidgetStateProperty.all(AppColors.primary.color),
        // side: AppElements.borderSide,
      );

  static SwitchThemeData _switch() => SwitchThemeData(
        overlayColor: WidgetStateProperty.all(AppColors.background.color),
        trackOutlineColor: WidgetStateProperty.all(AppColors.primary.color),
        thumbColor: WidgetStateProperty.all(AppColors.background.color),
      );

  static DividerThemeData _divider() => DividerThemeData(
        color: AppColors.secondary.color,
      );
}
