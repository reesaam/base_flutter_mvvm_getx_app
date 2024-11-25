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
### Icons
- For any possible change in Launcher Icon
- first change the file in assets : <<assets/logos/app_logo.png>> (Please replace the file)
- then run:
```
dart run flutter_launcher_icons -f flutter_launcher_icons.yaml
```

# How to Manage

### lib/admin
Everything that you need for Administration that mostly would be separated from the App, 

### lib/app
- Main Widgets and Components (Buttons, Dialogs, Indicators, AppBar, Drawer, ...)
- 
### lib/core
- All Bindings, Routing, Core Elements, Extensions, ...
- Core Functions (Data Manipulations Functions, AppExit, Connection Checker, ...) that you may need all over the App
- Core Widgets that you can use globally all over the App
- All Extensions and Data Manipulation Functions
- Network Functions

### lib/data
- App Info and Data
- All Data and Resources you need
- Global Entities and Models
- Storage and Data Functions and Implementation

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