import '../../core/app_routing/app_routing.dart';
import '../../core/core_resources/page_details.dart';

enum DeepLinkTypes {
  unknown();

  const DeepLinkTypes();
}

extension OnDeepLinkTypes on DeepLinkTypes {
  void pageRedirect() {
    final page = switch (this) {
      DeepLinkTypes.unknown => AppPages.notFound,
    };
    goToPage(page);
  }
}
