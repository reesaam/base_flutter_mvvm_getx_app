import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

import '../../admin_general_functions.dart';
import '../controller/app_docs_controller.dart';

@GetPut.controller()
class AppDocsPage extends CoreView<AppDocsController> {
  const AppDocsPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [AppDividers.generalWithDisabledColor, _mainDocs()]);

  _mainDocs() => AdminFunctions.sectionGrid(
    items: [AdminFunctions.itemButton(text: 'Docs Generate', function: controller.generateDocs)],
    title: 'Main Docs',
  );
}
