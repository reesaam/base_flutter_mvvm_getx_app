# Overview

## Repository layout

```text
base_flutter_mvvm_getx_app/
├─ lib/                  App source (see below)
├─ test/                 Unit and widget tests
├─ config/
│  ├─ barrels.yaml       Barrel generation config
│  ├─ icons.yaml         Launcher icon config
│  └─ envs/              Environment JSON files (dart-defines)
├─ tool/
│  └─ generate_barrels.dart   CLI that regenerates lib/barrels
├─ packages/
│  └─ barrel_import_lints/    Analyzer plugin enforcing barrel-only imports
├─ assets/               Logos and fonts
├─ documentation/        This documentation
├─ builder.bat           One-shot clean + generate on Windows
└─ pubspec.yaml
```

## `lib/` at a glance

| Folder | Contains |
|---|---|
| `admin/` | Development-only pages (widget check, app info, resources, verifiers, countries, docs) |
| `barrels/` | **Generated** export files. The only files other modules may import |
| `builders/`, `tooling/` | build_runner builder and shared logic for barrel generation |
| `components/` | Small app-wide helpers registered as `@GetPut.component()`: environment handler, file functions, permissions, share, UUID, failure types |
| `core/` | The app's foundation: base classes (`core_elements`), annotations, routing, info and defaults, flavors/env config, layout, resources (enums, flags, API URLs, texts), extensions, global functions |
| `features/` | One folder per page: `controller/`, `view/`, and optionally `data/`, `widgets/`, `models/` |
| `localization/` | i69n YAML sources, generated translations, `AppLocalizations`, and `Texts` |
| `services/` | Long-lived `@GetPut.service()` singletons: logger, storage, secure storage, network (Dio), connectivity, notifications, deep links, statistics, device info |
| `shared/` | Cross-feature code: `shared_models` (Freezed), `shared_repositories`, `shared_widgets` |
| `ui_kit/` | Theme and reusable widgets |
| `main.dart` | Bootstrap and `GetMaterialApp` |
| `main.get_put.dart` | **Generated** pages and dependency bindings |

## Features in the template

| Feature | Purpose |
|---|---|
| `splash_screen` | Increments launch statistics, then routes to Home |
| `homepage` | Landing page |
| `settings` | Language, dark mode, update check, backup/restore, erase data |
| `update` | Check for and download a new version |
| `versions` | Version list, used by update checks (no page) |
| `about` | App, device, and developer info rows |
| `not_found` | Unknown-route page |

## Services in the template

| Service | Responsibility |
|---|---|
| `LoggerService` | Leveled logging (`debug`/`info`/`warning`/`error`), console off in release, optional file sink |
| `AppStorageService` | Load and save `AppData`. The storage engine (GetStorage or SharedPreferences) is injected |
| `SecureStorageService` | Abstract secure key/value store for tokens and sensitive data |
| `DioCore` | Singleton Dio client with `AuthInterceptor`, `RetryInterceptor`, `LoggingInterceptor` |
| `AppConnectionService` | Internet status and connection type, reactive and on-demand |
| `AppLocalNotificationService` | Local notifications (awesome_notifications) |
| `DeepLinkService` | Listens for app links and routes by link type |
| `AppStatisticsService` | Counts launches, logins, crashes, page opens, API calls |
| `AppDeviceInfoService` | App version and build, OS, device model, locale, and environment as an `AppDeviceInfo` model |
