import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

import '../controller/not_found_controller.dart';

@GetPut.page(isUnknown: true)
class NotFoundPage extends CoreView<NotFoundController> {
  const NotFoundPage({super.key});

  @override
  Widget get body => AppContainer(
    alignment: Alignment.center,
    width: Get.width,
    height: Get.height - 100,
    child: Stack(children: [_widgetMain()]),
  );

  Widget _widgetMain() => AppContainer(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [controller.icon.withSize(Get.size.width / 6), Text(Texts.to.pagesName.notFoundPageName)],
    ),
  );
}
