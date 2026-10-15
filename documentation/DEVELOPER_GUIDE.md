# Developer Guide

## Setup

```bash
flutter pub get
dart run tool/generate_barrels.dart
dart run build_runner build --delete-conflicting-outputs
```

On Windows, `.\builder` runs `flutter clean`, `pub get`, barrel generation, and `build_runner` in that order. After changing `analysis_options.yaml` plugins, restart the Dart Analysis Server.

## Commands

| Task | Command |
|---|---|
| Regenerate barrels | `dart run tool/generate_barrels.dart` |
| Check barrels are up to date (CI) | `dart run tool/generate_barrels.dart --check` |
| Generate Freezed, JSON, GetX bindings, i69n | `dart run build_runner build --delete-conflicting-outputs` |
| Watch while editing models | `dart run build_runner watch --delete-conflicting-outputs` |
| Analyze | `flutter analyze` |
| Test | `flutter test` (or `flutter test test/services`) |
| Build | `flutter build apk\|ipa\|web --release --dart-define-from-file=config/envs/env.production.json` |
| Launcher icons | Replace `assets/logos/app_logo.png`, then `dart run flutter_launcher_icons -f config/icons.yaml` |
| Rename app | `dart run rename setAppName --targets ios,android,macos,windows,linux --value "AppName"` |
| Change bundle id | `dart run rename setBundleId --targets ios,android,macos,windows,linux --value "com.company.app"` |
| Change package name | `dart run change_app_package_name:main com.company.app` |

CI (`.github/workflows/dart.yml`) runs pub get, the barrel check, build_runner, `flutter analyze` (fails on errors only), and `flutter test`.

Run barrel generation and `build_runner` again whenever you add a file, an annotated class, a model, or a localization key.

## Environments

The active environment name is set in `lib/core/core_info/app_info.dart` (`AppInfo.environment`). Its settings come from a JSON file passed at run and build time:

```bash
flutter run --dart-define-from-file=config/envs/env.development.json
flutter build apk --release --dart-define-from-file=config/envs/env.production.json
```

| Key | Purpose |
|---|---|
| `BASE_URL` | API host without scheme, for example `resam.site` |
| `API_SUBDOMAIN` | For example `www` or `stage`. The API base becomes `https://{API_SUBDOMAIN}.{BASE_URL}/v1/` |
| `ENABLE_SENTRY` / `SENTRY_DSN` | Gate for Sentry (both required). `sentry_flutter` is commented out in `pubspec.yaml`; uncomment it and the calls in `LoggerService` / `AppDeviceInfoService` to enable |
| `SECURE_STORAGE_PASSWORD` | Password for secure storage |
| `AUTH_DEMO_MODE` | Exposed as `EnvConfig.authDemoMode` for an auth feature to read (default `true`). Nothing in the template uses it yet |

Booleans must be JSON strings (`"true"` / `"false"`). `env.local.json` and `env.production.json` are gitignored; never commit real secrets. Pass the same file to both `run` and `build`, otherwise release binaries use the defaults.

## Adding things

### A feature (page)

1. Create `lib/features/<name>/controller/<name>_controller.dart`:

   ```dart
   @GetPut.controller()
   class ReportsController extends CoreController {
     final RxList<String> items = List<String>.empty(growable: true).obs;

     @override
     void pageInit() => pageDetail = AppPages.reports;
   }
   ```

2. Create `lib/features/<name>/view/<name>_view.dart`:

   ```dart
   @GetPut.page()
   class ReportsPage extends CoreView<ReportsController> {
     const ReportsPage({super.key});

     @override
     Widget get body => Obx(() => Text('${controller.items.length}'));
   }
   ```

3. Add an `AppPageDetail` for it in `AppPages` (`core_resources/page_details.dart`), with its name taken from `Texts.to.featureName`
4. Add any page-only data access in `data/` as an abstract repository plus `Impl`, annotated `@GetPut.repository(as: ReportsRepository)`
5. Put feature-only models in `lib/features/<name>/models/`
6. Run `build_runner`, then navigate with `goToPage(AppPages.reports)`

### A service

1. Create the main file in `lib/services/<name>/` with `@GetPut.service()`, or `@GetPut.service(as: Abstract)` if callers should depend on an abstract
2. Inject plugin instances through the constructor so tests can pass fakes (see `AppConnectionService` and `AppDeviceInfoService`)
3. `export` the files callers need from the main file, and add them to `exclude` in `config/barrels.yaml`. Internal helpers go in `exclude` only
4. Keep plugin types inside the service. Callers get this app's models
5. Regenerate barrels and run `build_runner`

### A shared model

Use when several features or services use the data. Follow the existing Freezed template:

```dart
part 'app_example.freezed.dart';
part 'app_example.g.dart';

@FreezedCustom.model
abstract class AppExample with _$AppExample {
  const factory AppExample({required final String id, final String? name}) = _AppExample;

  factory AppExample.fromJson(Map<String, dynamic> json) => _$AppExampleFromJson(json);
}

@FreezedCustom.modelList
abstract class AppExampleList with _$AppExampleList {
  factory AppExampleList({@Default(<AppExample>[]) List<AppExample> exampleList}) = _AppExampleList;

  factory AppExampleList.fromJson(Map<String, dynamic> json) => _$AppExampleListFromJson(json);
}
```

Place it in `lib/shared/shared_models/core_models/<name>/<name>.dart`. A model used by only one feature or service stays next to that feature or service.

### A string

Add it to `lib/localization/translation.i69n.yaml` (and the Persian file when translated) in the section that matches, then run `build_runner` and use `Texts.to.<section>.<key>`.

## Conventions

- **OOP first.** Behavior lives on classes, services, and enums, not in loose top-level functions or maps
- **Models, not maps.** Do not pass domain data as `Map` with string keys. Convert to JSON only at a boundary, via `toJson`/`fromJson`
- **No hardcoded values.** Use enums (`AppStorageKeys`, `LoggerLevel`, `AppPages`), `Texts.to.*`, `AppInfo`, `AppDefaults`, `AppPaddings`, `AppTexts`
- **Enum data as parameters.** Data that belongs to an enum value goes in its constructor, like `AppLanguages`. A short derived mapping can be a getter or an extension in `core/extensions/enums_extensions/`
- **Barrel imports only.** See [Architecture](ARCHITECTURE.md#barrels-and-the-import-rule)
- **Abstract DI.** Resolve abstracts with `Foo.to`; never `Get.find<FooImpl>()`
- **Expression bodies** for single-expression members (`=>`)
- **Empty lists** as `List<T>.empty(growable: true)`, except in const contexts such as Freezed `@Default`
- **Logging** through `LoggerService.to.debug/info/warning/error`. No `print`

## Testing

```text
test/
├─ app/         EnvConfig
├─ components/  Interceptors, exception handlers
├─ core/        Layout model
├─ services/    Logger, storage, secure storage, connectivity, notifications, statistics, device info
└─ ui_kit/      Widgets
```

- Use `mocktail` for plain interfaces such as `AppStoragesAbstraction` or plugin classes
- GetX services cannot be registered as raw mocks with `Get.put`. Write a small fake that extends `CoreService` / `CoreRepository` and implements the abstract
- Reset GetX around each test: `Get.testMode = true; Get.reset();` in `setUp`, `Get.reset` in `tearDown`
- Inject plugin data through constructors (for example `AppDeviceInfoService(info: ...)`) so tests never touch platform channels

## Common pitfalls

| Symptom | Cause / fix |
|---|---|
| `X not found` from GetX | The class is missing its annotation, or `build_runner` was not re-run |
| Red import error | Import the barrel, not the file. Check the export and `exclude` in `config/barrels.yaml` |
| A new file is not visible through its barrel | Re-run `dart run tool/generate_barrels.dart` |
| Wrong API host in a release build | `--dart-define-from-file` was not passed to `flutter build` |
| Secure storage returns nothing | `GetSecureStorage.init` must run first (done in `main.dart`) |
| Scroll leaks or janky pages | Use `CoreView`'s `enableBodyScroll` / `pagePadding` instead of creating a `ScrollController` in `build` |
| Stale context crash | Use `controller.context` when needed; never cache `Get.context!` in a field |
| Admin pages in production | They are reachable from the homepage; gate or remove them before shipping |
