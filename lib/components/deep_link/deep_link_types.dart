import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';

enum DeepLinkTypes {
  /// Add Any Type That you may need in your Application
  unknown();

  const DeepLinkTypes();
}

extension OnDeepLinkTypes on DeepLinkTypes {
  /// Types would be handled here to redirect to the proper pages
  /// [AppPageDetail] in [AppPages] can't be an argument in enu because it can't be constant
  void pageRedirect() {
    final page = switch (this) {
      DeepLinkTypes.unknown => AppPages.homepage,
    };
    goToPage(page);
  }
}
