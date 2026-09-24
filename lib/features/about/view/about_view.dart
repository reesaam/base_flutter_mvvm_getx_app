import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

import '../controller/about_controller.dart';
import '../widgets/about_items_widgets.dart';

@GetPut.page()
class AboutPage extends CoreView<AboutController> {
  const AboutPage({super.key});

  @override
  Widget get body => Obx(
    () => Column(
      children: controller.items.map((item) => AboutSectionWidget(item: item)).toList(),
    ),
  );
}
