import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';
import '../controller/update_controller.dart';

@GetPut.page()
class UpdatePage extends CoreView<UpdateController> {
  const UpdatePage({super.key});

  @override
  Widget? get footer => _widgetButtons();

  @override
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _widgetVersions(),
      ]);

  Widget _widgetVersions() => Card(
      child: Container(
          padding: AppPaddings.updateVersions,
          child: Column(children: [
            _widgetVersion(Texts.to.update.updateCurrentVersion, AppInfo.currentVersion.version),
            AppSpaces.h10,
            Obx(() => _widgetVersion(
                  Texts.to.update.updateAvailableVersion,
                  controller.updateAvailability() ? controller.availableVersion.value : Texts.to.general.notAvailable,
                )),
          ])));

  Widget _widgetVersion(String title, String version) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(version)],
      );

  Widget _widgetButtons() => Obx(() => Container(
      padding: AppPaddings.updateButtons,
      child: Column(children: [
        AppButton.general(
          text: Texts.to.update.updateCheckUpdate,
          loading: controller.buttonCheckUpdateLoading.value,
          onTap: controller.checkUpdate,
        ),
        AppButton.general(
          text: Texts.to.update.updateDownloadUpdate,
          loading: controller.buttonDownloadUpdateLoading.value,
          onTap: controller.downloadUpdate,
          disabled: controller.updateAvailability(),
        ),
      ])));
}
