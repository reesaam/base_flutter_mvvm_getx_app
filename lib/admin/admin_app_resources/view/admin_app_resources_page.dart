import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

import '../../../ui_kit/theme/color_palette.dart';
import '../../admin_general_functions.dart';
import '../controller/admin_app_resources_controller.dart';

@GetPut.page()
class AdminAppResourcesPage extends CoreView<AdminAppResourcesController> {
  const AdminAppResourcesPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [
        AppDividers.generalWithDisabledColor,
        _appDefaults(),
        _appAPIs(),
        _appColors(),
        _appColorPalette(),
      ]);

  _appDefaults() => AdminFunctions.section([
        AdminFunctions.item(title: 'Font Size', text: AppDefaults.fontSize.toInt().toString()),
        AdminFunctions.item(title: 'Connection Timeout', text: AppDefaults.timeOutConnection.inSeconds.toString()),
        AdminFunctions.item(title: 'Transition', text: AppDefaults.transition.name),
        AdminFunctions.item(title: 'Transition Duration', text: AppDefaults.transitionDuration.inSeconds.toString()),
        AdminFunctions.item(
            title: 'Page Transition Delay', text: AppDefaults.pageTransitionDelay.seconds.inSeconds.toString()),
        AdminFunctions.item(title: 'Circular Progress Bar Width', text: AppDefaults.borderWidth.toInt().toString()),
        AdminFunctions.item(
            title: 'SnackBar Animation Duration',
            text: AppDefaults.snackBarAnimationDuration.inSeconds.toInt().toString()),
        AdminFunctions.item(
            title: 'SnackBar Duration', text: AppDefaults.snackBarDuration.inSeconds.toInt().toString()),
        AdminFunctions.item(title: 'Snack Position', text: AppDefaults.snackBarPosition.toString().split('.').last),
        AdminFunctions.item(title: 'Border Width', text: AppDefaults.borderWidth.toInt().toString()),
      ], title: 'App Defaults');

  _appColors() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                        children: List<Widget>.generate(
                            AppColors.values.length,
                            (index) => AdminFunctions.item(title: AppColors.values[index].name, multipleItems: <Widget>[
                                  _colorWidget(color: AppColors.values[index]),
                                  AppSpaces.w10,
                                  _colorWidget(color: AppColors.values[index], dark: true)
                                ]))))),
            fullWidth: true)
      ], title: 'App Colors');

  _appColorPalette() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                        children: List<Widget>.generate(
                            AppColorPalette.values.length,
                            (index) =>
                                AdminFunctions.item(title: AppColorPalette.values[index].name, multipleItems: <Widget>[
                                  _colorWidget(colorPalette: AppColorPalette.values[index]),
                                  AppSpaces.w10,
                                  _colorWidget(colorPalette: AppColorPalette.values[index], dark: true),
                                ]))))),
            fullWidth: true)
      ], title: 'App Color Palette');

  _appAPIs() => AdminFunctions.section([
        AdminFunctions.item(title: 'Base URL', text: currentEnvironment.baseUrl),
        AdminFunctions.item(title: 'API Version', text: APIVersions.v1.getValue),
        AdminFunctions.item(title: 'API Base URL', text: 'https://${currentEnvironment.baseUrl}/'),
      ], title: 'App APIs');

  _colorWidget({AppColors? color, AppColorPalette? colorPalette, bool? dark, bool? gradient}) {
    AppColorPalette innerColor = color?.colorPalette ?? colorPalette ?? AppColorPalette.values.first;
    return AppContainer(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: AppElements.borderRadiusHigh,
          border: Border.all(color: Colors.black, width: 2),
          color: gradient == true
              ? null
              : dark == true
                  ? innerColor.darkColor
                  : innerColor.lightColor,
          gradient: gradient == true
              ? dark == true
                  ? innerColor.darkGradient
                  : innerColor.lightGradient
              : null,
        ));
  }
}
