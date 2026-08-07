import '../../../barrels/annotations_barrel.dart';

import '../deep_link_types.dart';

part 'deep_link_handler_data_model.freezed.dart';
part 'deep_link_handler_data_model.g.dart';

@FreezedCustom.model
abstract class DeepLinkCallBackUrlData with _$DeepLinkCallBackUrlData {
  const factory DeepLinkCallBackUrlData({
    required final DeepLinkTypes type,
    final List<String>? params,
  }) = _DeepLinkCallBackUrlData;

  factory DeepLinkCallBackUrlData.fromJson(Map<String, dynamic> json) => _$DeepLinkCallBackUrlDataFromJson(json);
}
