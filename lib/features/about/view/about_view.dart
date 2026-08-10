import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

import '../controller/about_controller.dart';
import '../widgets/about_items_widgets.dart';

@GetPut.page()
class AboutPage extends CoreView<AboutController> {
  const AboutPage({super.key});

  @override
  Widget get body => Column(
    children: List<Widget>.generate(
      controller.listItems.length,
      (index) => AboutSectionWidget(titleText: controller.listTitles[index], itemText: controller.listItems[index]),
    ),
  );
}
