import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

import '../controller/admin_start_controller.dart';

@GetPut.page()
class AdminStartPage extends CoreView<AdminStartController> {
  const AdminStartPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget? get floatingActionButton => AppFloatingActionButtons(icon: AppIcons.add.widget, onPressed: () {});

  @override
  Widget get body => Column(children: [_sectionsButtons()]);

  Widget _sectionsButtons() => AppContainer(
    padding: AppPaddings.buttonLarge,
    child: Column(
      children: List<Widget>.generate(
        AppPages.listAdminPages.length,
        (index) => index == 0
            ? AppBox.shrink()
            : AppButton.general(
                text: controller.pages[index].pageName ?? Texts.to.general.notAvailableInitials,
                onTap: () => goToPage(controller.pages[index]),
              ),
      ),
    ),
  );
}
