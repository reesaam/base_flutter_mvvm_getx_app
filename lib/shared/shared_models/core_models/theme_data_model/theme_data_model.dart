class AppThemeDataModel<T> {
  AppThemeDataModel({required this.lightThemeData, required this.darkThemeData});

  final T lightThemeData;
  final T darkThemeData;
}

extension ThemeModeDetection on AppThemeDataModel {
  T getMode<T>(bool isDark) => isDark ? darkThemeData : lightThemeData;
}
