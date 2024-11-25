import 'package:flutter/material.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_elements/core_view.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../controller/about_controller.dart';
import '../widgets/about_items_widgets.dart';

@GetPut.page()
class AboutPage extends CoreView<AboutController> {
  const AboutPage({super.key});

  @override
  Widget get body => Column(
      children: List<Widget>.generate(controller.listItems.length,
          (index) => AboutSectionWidget(titleText: controller.listTitles[index], itemText: controller.listItems[index])));
}
