import '../../../barrels/annotations_barrel.dart';

import '../deep_link_types.dart';

part 'deep_link_service_data_model.freezed.dart';
part 'deep_link_service_data_model.g.dart';

@FreezedCustom.model
abstract class DeepLinkServiceCallBackData with _$DeepLinkServiceCallBackData {
  const factory DeepLinkServiceCallBackData({required final DeepLinkTypes type, final List<String>? params}) = _DeepLinkServiceCallBackData;

  factory DeepLinkServiceCallBackData.fromJson(Map<String, dynamic> json) => _$DeepLinkServiceCallBackDataFromJson(json);
}
