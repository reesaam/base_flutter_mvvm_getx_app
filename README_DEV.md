# Base Flutter MVVM GetX App

### A Flutter Base Project using:
 - MVVM Architecture
 - GetX State-Managements
 - Freezed, Dartz
 - Dependency Injection
 - Dio, Retrofit, Interceptor
 - Intl App Localization, Countries Specifications (Flags, TimeZones, etc.)
 - Get Storage, Shared Preferences, Mongo DB
 - Animations and UI Elements

## Getting Started

- Download and Clone the Repository
- Clean the project files and folders:
```
flutter clean
```

- Get pubspec Updated for all available and used packages:
```
flutter pub get
```

- Build runner Command:
```
dart pub run build_runner build --delete-conflicting-outputs
```

--> or run this instead all above:
```
.\builder
```

## Outputs
- for android apk:
```
flutter build apk --debug/--release/--profile --no-tree-shake-icons
```

- for iOS (ipa):
```
flutter build ipa
```

- for web output:
```
flutter build web --web-renderer canvaskit --release
```
```
(--web-renderer html/canvaskit) for different renderers
```
- ...

## Test
```
flutter test
```

## Others
### Localization
- Localization uses `intl_utils` to generate localizations
- For any problem in `Localization` use:
```
dart run intl_utils:generate
```

### Icons
- For any possible change in Launcher Icon
- first change the file in assets : <<assets/logos/app_logo.png>> (Please replace the file)
- then run:
```
dart run flutter_launcher_icons -f flutter_launcher_icons.yaml
```

# How to Manage

### lib/admin
Everything that you need for Administration that mostly would be separated from the App, It mostly uses in the development phase. Checking widgets is possible this way.
- Widget Test
- Functionality Test
- Components Test
- Verifiers, Format Checkers or Regexes
- Or any component that need to be checked or tested

### lib/components
All Components would be placed here
- Failures
- Network
- Storage
- File Manipulation
- Docs
- Permissions
- Notifications

### lib/core
- This is the Core of the App, every Information or functionality which provides and creates core of the app 
- All Bindings, Routing, Core Elements, Extensions, ...
- Core Functions (Data Manipulations Functions, AppExit, Connection Checker, ...) that you may need all over the App
- All Extensions and Data Manipulation Functions

### lib/features
- Main place and develop all features of the app, every page counted as features here 

### lib/shared
- Model, Entities, Mappers or any type of data models which will use all over the app would place in this folder, they all mostly will decorate with `freezed` for ease of use.  

### lib/ui_kit
- Theme
- Main Widgets (AppBar, Drawer, BottomNavigationBar, ...)
- Dialogs, Sheets and Prompts
- All Widgets (TextField, Radio, Buttons, CheckBox, ...)

### Package Manipulation
with Rename:
```
dart global activate rename
```
```
dart run rename getAppName --targets ios,android,macos,windows,linux
```
```
dart run rename setAppName --targets ios,android,macos,windows,linux --value "AppName"
```
```
dart run rename setBundleId --targets ios,android,macos,windows,linux --value "com.resam.bundleId"
```
with Change Package Name:
```
dart run change_app_package_name:main com.new.package.name
```