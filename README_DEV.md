# Base Flutter MVVM GetX App

### A Flutter Base Project using:
 - MVVM Architecture (with Shared-Models Optimization)
 - GetX State-Managements
 - Freezed, Dartz
 - Dependency Injection
 - Dio, Retrofit, Interceptor
 - Intl App Localization i69, Countries Specifications (Flags, TimeZones, etc.)
 - Get Storage, Shared Preferences, Mongo DB
 - Import Optimization with Barrels Implementation
 - GetX Binding and Routing Generator Package
 - Centralized UI Kit
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
or
```
dart pub get
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
flutter build apk --debug/--release/--profile
```

- for iOS (ipa):
```
flutter build ipa --debug/--release/--profile
```

- for web output:
```
flutter build web --debug/--release/--profile
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
dart run flutter_launcher_icons -f config/icons.yaml
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

---

# Developer reference (must know)

Everything below is required knowledge for working on this template after the enterprise bootstrap (DI fixes, auth, EnvConfig, Sentry, Dio interceptors, tests).

## Architecture snapshot

| Layer / path | Role |
|---|---|
| `lib/app/bootstrap.dart` | App entry: Zone + `FlutterError` + `PlatformDispatcher` + Sentry + storage/DI init |
| `lib/app/flavors/env_config.dart` | Compile-time env via `--dart-define-from-file` JSON configs |
| `lib/app/di/app_bindings.dart` | GetX bindings + abstract DI fixes |
| `lib/app/di/binding_fixes.dart` | Ensures abstract types are registered after codegen |
| `lib/main.dart` | Calls `bootstrap(() => MainApp())` |
| `lib/main.get_put.dart` | Generated pages/controllers/components/repositories (patch DI types after regen) |
| `lib/features/auth/` | Login UI, session, remote data source |
| `lib/components/network/` | Singleton Dio + auth/retry/logging interceptors |
| `lib/components/crash_reporting/` | Sentry wrapper (`CrashReporter`) |

Flow:

```
bootstrap → EnvConfig → AppBindings → SecureStorage.init → AuthSession.restore
         → runApp(GetMaterialApp)
Splash → authenticated ? Home : Login
```

## Daily commands

```bash
# Dependencies
flutter pub get

# Generate barrels (also runs via build_runner / builder.bat)
dart run tool/generate_barrels.dart

# Fail CI if barrels are stale
dart run tool/generate_barrels.dart --check

# Codegen (Freezed / JSON / GetX bindings / i69n / barrels builder)
dart run build_runner build --delete-conflicting-outputs

# Watch mode while editing models/bindings
dart run build_runner watch --delete-conflicting-outputs

# Static analysis
flutter analyze

# Tests
flutter test
flutter test test/ui_kit
flutter test test/components
flutter test test/app
flutter test test/features

# Format (optional)
dart format lib test

# Clean rebuild
flutter clean
flutter pub get
dart run tool/generate_barrels.dart
dart run build_runner build --delete-conflicting-outputs
```

Shortcut (Windows) if present:

```bash
.\builder
```

## Barrel generation (auto-exports)

Barrels under `lib/barrels/` are **generated**. Do not hand-edit them.

| Piece | Path |
|---|---|
| Config | `config/barrels.yaml` |
| CLI | `dart run tool/generate_barrels.dart` |
| CI check | `dart run tool/generate_barrels.dart --check` |
| Shared logic | `lib/tooling/barrels_generator.dart` |
| build_runner builder | `lib/builder.dart` (enabled in `build.yaml` / `pubspec.yaml`) |

**Strategy:** export **all** Dart files under each configured root (simplest for new files). Prune what you do not want via `exclude` / `exclude_names` in `config/barrels.yaml`.

Global skips by default: `*.g.dart`, `*.freezed.dart`, `*.mocks.dart`, private `_*.dart`, `part of` files, and `dio_functions.dart`.

### Without build_runner

```bash
dart run tool/generate_barrels.dart
```

### With build_runner

```bash
dart run build_runner build --delete-conflicting-outputs
```

The local `barrels` builder regenerates barrels as part of the build. `builder.bat` also runs the CLI first for a clean full rebuild.

### Add / tweak a barrel

Edit `config/barrels.yaml`, for example:

```yaml
barrels:
  - output: lib/barrels/components_barrel.dart
    library: true
    roots:
      - lib/components
    exclude:
      - some_file_i_do_not_want.dart
```

Then re-run `dart run tool/generate_barrels.dart`.

### Barrel import rule (analyzer)

Applies to **all of `lib/`** (not only features). Shared layers **and pub packages** must be imported via `lib/barrels/*_barrel.dart` (see `package_exports` in `config/barrels.yaml`).

Allowed without an ignore:
- barrel imports
- `dart:` SDK imports
- same-feature relatives (`features/<name>/...`)
- same barreled-root relatives
- `package:` imports only inside the owning barreled root / barrel `files:`

Features have **no** barrel — cross-feature and outside→feature imports need an explicit ignore. Existing non-compliant imports may keep their ignore comments rather than being rewritten.

Enforced by `packages/barrel_import_lints` in `analysis_options.yaml` (**errors** / red underline). After changing `plugins:`, restart the Dart Analysis Server.

```dart
// ignore: barrel_import_lints/only_barrel_imports
import '../../auth/data/auth_session.dart';
```

```dart
// ignore_for_file: barrel_import_lints/only_barrel_imports
```

## App environment

**Name** (dev / stage / production) — edit:

`lib/core/core_info/app_info.dart` → `AppInfo.environment`

`Environment` in `core_enums.dart` is **names only**.

**Settings** (URLs, Sentry, auth demo, passwords) — model `EnvironmentVariables` filled from JSON:

`config/envs/*.json` + `--dart-define-from-file=...`

Access via `EnvConfig.vars` / `currentEnvironmentSettings` / `EnvironmentHandler.settings`.

## Run / build with env config files (EnvConfig)

```bash
flutter run --dart-define-from-file=config/envs/env.development.json
flutter run --dart-define-from-file=config/envs/env.stage.json
flutter run --dart-define-from-file=config/envs/env.local.json
flutter build apk --release --dart-define-from-file=config/envs/env.production.json
```

### Config files

| File                                      | Committed? | Purpose |
|-------------------------------------------|---|---|
| `config/envs/env.development.json`        | yes | Default local / demo auth |
| `config/envs/env.stage.json`              | yes | Staging URLs / flags |
| `config/envs/env.local.json`              | **no** (gitignored) | Your machine-only secrets/overrides |
| `config/envs/env.production.json`         | **no** (gitignored) | Real production secrets (DSN, passwords) |

Example `config/envs/env.development.json`:

```json
{
  "BASE_URL": "resam.site",
  "API_SUBDOMAIN": "www",
  "ENABLE_SENTRY": "false",
  "SENTRY_DSN": "",
  "SECURE_STORAGE_PASSWORD": "dev_only_change_me",
  "AUTH_DEMO_MODE": "true"
}
```

Keys (booleans must be JSON strings `"true"` / `"false"`):

| Key | Type | Default | Purpose |
|---|---|---|---|
| `BASE_URL` | String | `resam.site` | Host only, e.g. `api.example.com` |
| `API_SUBDOMAIN` | String | `www` | e.g. `www`, `stage` |
| `ENABLE_SENTRY` | bool string | `false` | Must be `"true"` to init Sentry |
| `SENTRY_DSN` | String | empty | Sentry DSN URL |
| `SECURE_STORAGE_PASSWORD` | String | `dev_only_change_me` | Password for `get_secure_storage` init |
| `AUTH_DEMO_MODE` | bool string | `true` | Accept any non-empty login without real API |

API URL shape:

```text
https://{API_SUBDOMAIN}.{BASE_URL}/{apiVersion}/...
```

`EnvironmentVariables.current` reads these via `String.fromEnvironment` / `bool.fromEnvironment`.

## Auth module

| Piece | Path |
|---|---|
| Login page | `lib/features/auth/view/login_view.dart` |
| Controller | `lib/features/auth/controller/auth_controller.dart` |
| Session | `lib/features/auth/data/auth_session.dart` |
| API | `lib/features/auth/data/auth_remote_data_source.dart` |
| Models | `lib/features/auth/models/auth_models.dart` |

- Splash restores session and routes to **Home** or **Login**.
- Tokens live in secure storage keys: `accessToken`, `refreshToken`, `authUser` (`AppStorageKeys`).
- `AuthInterceptor` attaches `Authorization: Bearer <token>` unless `X-Skip-Auth: true`.
- Settings → **Sign Out** clears session and returns to Login.
- Endpoints (when `AUTH_DEMO_MODE=false`): `.../auth/login`, `.../auth/logout`, `.../auth/refresh`, `.../auth/me`.

Expected login JSON shape (flexible keys supported):

```json
{
  "tokens": { "access_token": "...", "refresh_token": "...", "expires_at": "ISO-8601" },
  "user": { "id": "1", "email": "a@b.com", "display_name": "Name" }
}
```

## Dependency injection (critical)

1. Prefer **abstract** `Get.find()` types (`SecureStorageModule`, `*RemoteDataSource`, …).
2. After regenerating `main.get_put.dart`, confirm abstract registrations **or** rely on `applyBindingFixes()` via `AppBindings`.
3. Do not call `Get.find<FooImpl>()` from feature code when `Foo` abstract exists.
4. `AppBindings().dependencies()` runs in bootstrap **and** as `GetMaterialApp.initialBinding`.

If you see `"[SecureStorageModule] not found"` (or similar), regenerate bindings and/or check `lib/app/di/binding_fixes.dart`.

### Regenerate GetX bindings

```bash
dart run build_runner build --delete-conflicting-outputs
```

Then verify in `lib/main.get_put.dart`:

```dart
Get.lazyPut<SecureStorageModule>(() => SecureStorageModuleImpl(), fenix: true);
Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(), fenix: true);
# ... same pattern for Update/Versions data sources
```

## Network layer

- Singleton: `DioCore.to.client` (never `Dio()` per request).
- Interceptors (order): `AuthInterceptor` → `RetryInterceptor` → `LoggingInterceptor`.
- Retries: GET/HEAD only, on timeout / connection error / 502–504.
- Logging: debug only when `CoreFlags.isRelease == false`.
- Errors: `NetworkException.handleResponse` / `LocalException.handleResponse` **return** exceptions for `Either` — they must not throw.

## Crash reporting (Sentry)

- Package: `sentry_flutter`
- Wrapper: `CrashReporter` in `lib/components/crash_reporting/crash_reporter.dart`
- Enabled only when **both** `ENABLE_SENTRY=true` and `SENTRY_DSN` are set.
- Wired from `bootstrap`: Flutter errors, platform errors, and zone errors.
- Auth sets/clears Sentry user on login/logout.

## Global error handling

Configured in `lib/app/bootstrap.dart`:

- `runZonedGuarded`
- `FlutterError.onError` → `CrashReporter.recordFlutterError`
- `PlatformDispatcher.instance.onError` → `CrashReporter.recordError`

Do not remove these when changing `main.dart`.

## CoreView / CoreController notes

- Prefer `enableBodyScroll` / `pagePadding` on `CoreView` — do **not** create undisposed `ScrollController`s in `build`.
- Use `controller.context` / `contextOrNull` getters — do not cache `Get.context!` at field init time.
- Settings `appSettings.listen` must update fields only (no recursive `_fillData()` re-subscribe).

## Feature flags (`CoreFlags`)

`lib/core/core_resources/core_flags.dart`:

| Flag | Meaning |
|---|---|
| `isRelease` | Suppress debug prints when `true` |
| `checkUpdate` | Auto-check update on splash/settings |
| `clearData` | Clear local app data on splash |

Toggle manually for local experiments; prefer `config/envs/env.*.json` + `--dart-define-from-file` for env/API/Sentry.

## Localization (i69n)

- Sources: `lib/localization/translation.i69n.yaml`, `translation_fa.i69n.yaml`
- Access: `Texts.to....` (needs `BuildContext` / localization loaded)
- After YAML edits, run `build_runner` so `.i69n.dart` regenerates.

## Storage

| Provider | Use |
|---|---|
| GetStorage | Default app data (`AppStorage` / `AppData` JSON) |
| SharedPreferences | Alternate provider via `CoreDefaults.defaultStorageProvider` |
| GetSecureStorage | Tokens / sensitive keys — **must** `init(password)` before use (done in bootstrap) |

Change secure password via `SECURE_STORAGE_PASSWORD` (never commit real secrets).

## Tests layout

```text
test/
  app/           # EnvConfig, binding_fixes
  components/    # exceptions, retry interceptor
  features/auth/ # auth models
  ui_kit/        # AppBox, Switch, CheckBox, Dividers, Spaces, Progress
  widget_test.dart
```

```bash
flutter test
```

Dev dependency for mocks: `mocktail`.

## Launcher icons

1. Replace `assets/logos/app_logo.png`
2. Config: `flutter_launcher_icons.yaml`
3. Run:

```bash
dart run flutter_launcher_icons -f config/icons.yaml
```

## Linting

- Config: `analysis_options.yaml` (includes `flutter_lints`)
- Prefer relative imports (`prefer_relative_imports`)
- Prefer importing via `lib/barrels/*` in app code

## Admin module

- Dev/QA tools under `lib/admin/`
- Reachable from homepage in this template — gate or strip for production releases if shipping this app as-is

## Checklist for a new feature

1. Add `features/<name>/{controller,view,data,...}` with `@GetPut.page` / `@GetPut.controller` / `@GetPut.repository(as: Abstract)`
2. Run `build_runner`
3. Confirm abstract DI registration (+ `binding_fixes` if needed)
4. Add `AppPages` entry if route metadata is required
5. Wire navigation via `goToPage(AppPages....)`
6. Add unit/widget tests under `test/`
7. Use `EnvConfig` / secure storage / `CrashReporter` instead of ad-hoc globals

## Common pitfalls

- Regenerating `main.get_put.dart` can reintroduce `Impl`-only `lazyPut` — keep `applyBindingFixes` or re-patch abstracts.
- Calling secure storage before bootstrap init → failures / empty session.
- Forgetting `--dart-define-from-file=config/envs/env....json` on **both** `run` and `build` → wrong env in release binaries.
- Committing `config/envs/env.production.json` / `config/envs/env.local.json` with real secrets — keep them gitignored; commit only `.example` files.
- Using `Texts.to` / localized exception messages in pure unit tests without a widget tree — handlers fall back to status names when localization is unavailable.
- Creating `ScrollController()` inside `build` without dispose (use `CoreView` scroll flag instead).
