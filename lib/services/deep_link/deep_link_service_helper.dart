import '../../barrels/core_barrel.dart';
import '../../barrels/extensions_barrel.dart';

import '../../barrels/services_barrel.dart';
import 'deep_link_service_data_model/deep_link_service_data_model.dart';
import 'deep_link_types.dart';

String _signature = '${AppInfo.appNameInitials}Type';
String _paramsSeparator = '/';

class DeepLinkHandlerHelper {
  static String createCallBackUrl({required DeepLinkServiceCallBackData data}) {
    String result = '$_signature${data.type.name}';
    if (!data.params.isNullOrEmpty) data.params!.forEach((e) => result += '$_paramsSeparator${e.toLowerCase()}');
    return result;
  }

  static DeepLinkServiceCallBackData? getDataFromCallBackUrl(String callbackUrl) {
    List<String> parts = callbackUrl.split(_paramsSeparator);
    List<String> params = List<String>.empty(growable: true);

    if (parts.any((element) => element.contains(_signature))) {
      final typeIndex = parts.indexWhere((element) => element.contains(_signature));
      String typeString = parts[typeIndex].replaceFirst(_signature, '');
      DeepLinkTypes type = DeepLinkTypes.values.firstWhere((e) => e.name == typeString);
      parts.removeAt(typeIndex);
      parts.removeWhere((element) => element.isNullOrEmpty);
      parts.removeWhere((element) => element.contains('http'));
      parts.removeWhere((element) => element == '#');
      parts.removeWhere((element) => element == _paramsSeparator);
      if (!parts.isNullOrEmpty) params.addAll(parts);
      LoggerService.to.debug(message: 'getDataFromCallBackUrl type: ${type.name}');
      LoggerService.to.debug(message: 'getDataFromCallBackUrl params: $params');
      return DeepLinkServiceCallBackData(type: type, params: params);
    } else {
      return null;
    }
  }
}
