import '../../core/core_functions.dart';
import '../../core/core_info/app_info.dart';
import '../../core/extensions/data_types_extensions/extension_list.dart';
import '../../core/extensions/data_types_extensions/extension_string.dart';
import 'deep_link_handler_data_model.dart';
import 'deep_link_types.dart';

String _signature = '${AppInfo.appNameInitials}Type';
String _paramsSeparator = '/';

class DeepLinkHandlerHelper {
  static String createCallBackUrl({required DeepLinkCallBackUrlData data}) {
    String result = '$_signature${data.type.name}';
    if (!data.params.isNullOrEmpty) data.params!.forEach((e) => result += '$_paramsSeparator${e.toLowerCase()}');
    return result;
  }

  static DeepLinkCallBackUrlData? getDataFromCallBackUrl(String callbackUrl) {
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
      appDebugPrint('getDataFromCallBackUrl type: ${type.name}');
      appDebugPrint('getDataFromCallBackUrl params: $params');
      return DeepLinkCallBackUrlData(type: type, params: params);
    } else {
      return null;
    }
  }
}
