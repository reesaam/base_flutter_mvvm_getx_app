import 'package:flutter/material.dart';

import '../../../core/core_elements/core_view.dart';
import '../../../ui_kit/general_widgets/dividers.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../../admin_general_functions.dart';
import '../controller/app_docs_controller.dart';

class AppDocsPage extends CoreView<AppDocsController> {
  const AppDocsPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [
        AppDividers.generalWithDisabledColor,
        _mainDocs(),
      ]);

  _mainDocs() => AdminFunctions.sectionGrid(items: [
        AdminFunctions.itemButton(text: 'Docs Generate', function: controller.generateDocs),
      ], title: 'Main Docs');
}
