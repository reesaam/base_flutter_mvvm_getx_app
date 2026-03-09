import '../../../../barrels/annotations_barrel.dart';
import '../../../../barrels/core_barrel.dart';
import '../../../../barrels/core_resources_barrel.dart';

part 'app_version.freezed.dart';
part 'app_version.g.dart';

@FreezedCustom.model
abstract class AppVersion with _$AppVersion {
  const factory AppVersion({
    required final String version,
    final List<String>? changes,
    final AppVersionTypes? versionType,
    final bool? isForceUpdate,
  }) = _AppVersion;

  factory AppVersion.fromJson(Map<String, dynamic> json) => _$AppVersionFromJson(json);

  factory AppVersion.createEmpty() => AppVersion(version: AppInfo.currentVersion.version);
}

@FreezedCustom.modelList
abstract class AppVersionsList with _$AppVersionsList {
  factory AppVersionsList({@Default(<AppVersion>[]) List<AppVersion> versionsList}) = _AppVersionsList;

  factory AppVersionsList.fromJson(Map<String, dynamic> json) => _$AppVersionsListFromJson(json);
}
