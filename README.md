# Base Flutter MVVM GetX App

<a href="https://github.com/reesaam/base_flutter_mvvm_getx_app"><img src="https://img.shields.io/badge/repo-Base_Flutter_App_/_MVVM_GetX-yellowgreen?logo=github" alt="build"></a>

**Resam Taghipour's base application for Flutter: MVVM on GetX, ready to build on.**

## What you get

- **Architecture:** MVVM with `CoreView` / `CoreController` / `CoreRepository` / `CoreService`, plus generated GetX bindings and routes
- **Data:** `Freezed` models, `dartz` `Either` results, typed exceptions
- **Network:** a single `Dio` client with auth, retry, and logging interceptors
- **Storage:** `GetStorage` or `SharedPreferences`, with `GetSecureStorage` for secrets
- **Environments:** development, stage, and production via `--dart-define-from-file`
- **Services:** logger, connectivity, notifications, deep links, statistics, device/app info
- **Components:** permissions, share, file functions, UUID
- **Localization:** i69n YAML (English, Persian)
- **UI kit:** theme, app bar, drawer, bottom bar, buttons, text fields, dialogs, sheets, snackbars, popup menu
- **Imports:** generated barrels, enforced by a custom lint
- **Admin pages:** check widgets, resources, regexes, and app info while developing
- **Tooling:** launcher icon generator, rename and package-name tools

## Quick start

```bash
flutter pub get
dart run tool/generate_barrels.dart
dart run build_runner build --delete-conflicting-outputs
flutter run --dart-define-from-file=config/envs/env.development.json
```

On Windows, `.\builder` does the first three steps.

## Documentation

- [Overview](documentation/OVERVIEW.md): folders, features, services
- [Architecture](documentation/ARCHITECTURE.md): layers, DI, data flow, import rules
- [Developer Guide](documentation/DEVELOPER_GUIDE.md): commands, environments, adding code, tests

> [!Tip]
> Use this repo as an upstream of your app to keep merging its updates.

> [!Note]
> Merge requests with improvements or useful features are welcome.

## About Author

### Resam Taghipour
<a href="https://www.resam.site"><img src="https://img.shields.io/badge/Website-resam.site-blue" alt="Pub"></a>
<a href="https://github.com/reesaam"><img src="https://img.shields.io/badge/GitHub-reesaam-black?style=flat&logo=github&link=https%3A%2F%2Fgithub.com%2Freesaam" alt="account"></a>
<a href="https://www.linkedin.com/in/resam"><img src="https://img.shields.io/badge/LinkedIn-resam-blue?logo=linkedin" alt="Pub"></a>
<a href="emailto:resam@resam.site"><img src="https://img.shields.io/badge/Email-resam-important?logo=maildotru" alt="Pub"></a>

## License
This project is licensed under the '**BSD-3-Clause**' License - see the LICENSE for details.

<a href="https://pub.dev/packages/base_flutter_mvvm_getx_app/license"><img src="https://img.shields.io/badge/LICENSE-blue" alt="Pub"></a>
