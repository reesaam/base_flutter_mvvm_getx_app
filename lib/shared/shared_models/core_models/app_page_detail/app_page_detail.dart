import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/annotations/freezed_custom_annotation.dart';

part 'app_page_detail.freezed.dart';
part 'app_page_detail.g.dart';

@FreezedCustom.model
class AppPageDetail with _$AppPageDetail {
  const factory AppPageDetail({
    required final String pageRoute,
    final String? pageName,
    final int? bottomBarItemNumber,
    final bool? drawerPresence,
    final int? iconCode,
  }) = _AppPageDetail;

  factory AppPageDetail.fromJson(Map<String, dynamic> json) => _$AppPageDetailFromJson(json);
}

@FreezedCustom.modelList
class AppPageDetailsList with _$AppPageDetailsList {
  factory AppPageDetailsList({@Default(<AppPageDetail>[]) List<AppPageDetail> pageDetailsList}) = _AppPageDetailsList;

  factory AppPageDetailsList.fromJson(Map<String, dynamic> json) => _$AppPageDetailsListFromJson(json);
}
