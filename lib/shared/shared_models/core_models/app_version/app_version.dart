import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/annotations/freezed_custom_annotation.dart';
import '../../../../core/core_info/app_info.dart';
import '../../../../core/core_resources/core_enums.dart';

part 'app_version.freezed.dart';
part 'app_version.g.dart';

@FreezedCustom.model
class AppVersion with _$AppVersion {
  const factory AppVersion({
    required final String version,
    final List<String>? changes,
    @JsonEnum()
    final AppVersionTypes? versionType,
    final bool? isForceUpdate,
  }) = _AppVersion;

  factory AppVersion.fromJson(Map<String, dynamic> json) => _$AppVersionFromJson(json);

  factory AppVersion.createEmpty() => AppVersion(version: AppInfo.currentVersion.version);
}

@FreezedCustom.modelList
class AppVersionsList with _$AppVersionsList {
  factory AppVersionsList({@Default(<AppVersion>[]) List<AppVersion> versionsList}) = _AppVersionsList;

  factory AppVersionsList.fromJson(Map<String, dynamic> json) => _$AppVersionsListFromJson(json);
}
