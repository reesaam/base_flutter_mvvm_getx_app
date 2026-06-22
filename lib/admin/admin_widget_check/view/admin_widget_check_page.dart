import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

import '../../admin_general_functions.dart';
import '../controller/admin_widget_check_controller.dart';

@GetPut.page()
class AdminWidgetCheckPage extends CoreView<AdminWidgetCheckController> {
  const AdminWidgetCheckPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body =>
      Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppDividers.generalWithDisabledColor,
        _dividers(),
        _appBoxes(),
        _iconButtons(),
        _popUpMenu(),
        _textFields(),
        _generalButtons(),
        _checkBoxes(),
        _switches(),
        _images(),
        _progressIndicators(),
        _alertDialogs(),
        _bottomSheetDialog(),
        _snackBars(),
        _appBar(),
        _bottomNavigationBar(),
        _icons(),
      ]);

  Widget _dividers() => AdminFunctions.section([
        AdminFunctions.item(title: 'AppDividers General', widget: AppDividers.general()),
        AdminFunctions.item(
            primary: true, title: 'AppDividers General PrimaryColor', widget: AppDividers.generalWithPrimaryColor),
        AdminFunctions.item(
            title: 'AppDividers GeneralText', widget: AppDividers.generalWithInlineText(text: 'Some Text')),
        AdminFunctions.item(
            primary: true,
            title: 'AppDividers GeneralText PrimaryColor',
            widget: AppDividers.generalWithInlineText(text: 'Some Text')),
        AdminFunctions.item(title: 'AppDividers Settings', widget: AppDividers.settings),
      ], title: 'Dividers');

  Widget _appBoxes() {
    Widget _innerChild = Text('AppBox Child');

    return AdminFunctions.section([
      AdminFunctions.item(title: 'AppBox', widget: AppBox(child: _innerChild)),
      AdminFunctions.item(title: 'AppBox Expanded', widget: AppContainer(
          color: AppColors.primary,
          child: AppBox.expanded(child: _innerChild))),
    ], isRow: false, title: 'App Boxes');
  }

  Widget _iconButtons() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'IconButton\nDefaultColor',
            widget: AppButton.icon(
              icon: AppIcons.home,
              // text: 'IconButton',
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            primary: true,
            title: 'IconButton\nPrimaryColor',
            widget: AppButton.icon(
              icon: AppIcons.home,
              onTap: controller.functionCalledDialog,
            )),
      ], isRow: true, title: 'Icon Buttons');

  Widget _popUpMenu() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'Popup Menu\nDefaultColor',
            widget: AppPopupMenu(
                listItems: List<AppPopupMenuItem>.generate(
                    5,
                    (index) => AppPopupMenuItem(
                          text: 'Popup Menu Item',
                          onTapFunction: controller.functionCalledDialog,
                        )))),
        AdminFunctions.item(
            title: 'Popup Menu\nPrimaryColor',
            primary: true,
            widget: AppPopupMenu(
                primaryColorIcon: true,
                listItems: List<AppPopupMenuItem>.generate(
                    5,
                    (index) => AppPopupMenuItem(
                          text: 'Popup Menu Item',
                          onTapFunction: controller.functionCalledDialog,
                        ))))
      ], isRow: true, title: 'Popup Menu');

  Widget _textFields() {
    var textFieldHint = 'Text Field Hint';
    var textFieldLabel = 'Text Field Label';
    var textFieldData = 'Text Field Data';
    TextEditingController ctrl = TextEditingController();
    TextEditingController ctrlWithData = TextEditingController();
    TextEditingController ctrlWithMultipleLinesData = TextEditingController();
    ctrlWithData.text = textFieldData;
    ctrlWithMultipleLinesData.text = '$textFieldData\n$textFieldData\n$textFieldData\n$textFieldData';

    return AdminFunctions.section([
      AdminFunctions.item(
          title: 'TextField Editable with Leading Icon',
          widget: AppTextField.general(controller: ctrl, hint: textFieldHint, leadingIcon: AppIcons.info.widget)),
      AdminFunctions.item(
          title: 'TextField Editable with Prefix and Suffix',
          widget: AppTextField.general(
              controller: ctrl,
              hint: textFieldHint,
              prefixIcon: AppIcons.add.widget,
              prefixAction: controller.functionCalledDialog,
              suffixIcon: AppIcons.settings.widget,
              suffixAction: controller.functionCalledDialog)),
      AdminFunctions.item(
          title: 'TextField Not Editable',
          widget: AppTextField.general(
            editable: false,
            controller: ctrl,
            hasCounter: true,
            label: textFieldLabel,
            hint: textFieldHint,
            suffixIcon: AppIcons.settings.widget,
            suffixAction: controller.functionCalledDialog,
          )),
      AdminFunctions.item(
        title: 'TextField with Data',
        widget: AppTextField.general(
          controller: ctrlWithData,
          hasCounter: true,
          hint: textFieldHint,
          suffixIcon: AppIcons.settings.widget,
          suffixAction: controller.functionCalledDialog,
        ),
      ),
      AdminFunctions.item(
          title: 'TextField Expandable',
          widget: AppTextField.general(
            controller: ctrlWithMultipleLinesData,
            hasCounter: true,
            maxLength: 100,
            showMaxLength: true,
            label: textFieldLabel,
            hint: textFieldHint,
            suffixIcon: AppIcons.settings.widget,
            suffixAction: controller.functionCalledDialog,
          )),
      AdminFunctions.item(
          title: 'TextField Whole Widget Function',
          widget: AppTextField.general(
            controller: ctrl,
            label: textFieldLabel,
            hint: textFieldHint,
            wholeWidgetAction: controller.functionCalledDialog,
          )),
      AdminFunctions.item(
          title: 'TextField with Error',
          widget: AppTextField.general(
            controller: ctrlWithData,
            label: textFieldLabel,
            hint: textFieldHint,
            errorText: 'Error',
          )),
    ], title: 'TextFields');
  }

  Widget _generalButtons() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'AppGeneralButton',
            widget: AppButton.general(
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanel,
              leading: AppIcons.version,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            primary: true,
            title: 'AppGeneralButton PrimaryColor',
            widget: AppButton.general(
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanel,
              leading: AppIcons.version,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            title: 'AppGeneralButton Loading',
            widget: AppButton.general(
              loading: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanel,
              leading: AppIcons.version,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            primary: true,
            title: 'AppGeneralButton Primary Loading',
            widget: AppButton.general(
              loading: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanel,
              leading: AppIcons.version,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            title: 'AppGeneralButton Disabled',
            widget: AppButton.general(
              disabled: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanel,
              leading: AppIcons.version,
              onTap: controller.functionCalledDialog,
            )),
      ], title: 'General Buttons');

  Widget _checkBoxes() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'AppCheckBox\nChecked', widget: AppCheckBox(value: true, onChanged: (value) => null)),
        AdminFunctions.item(
            title: 'AppCheckBox\nNot Checked', widget: AppCheckBox(value: false, onChanged: (value) => null)),
      ], isRow: true, title: 'CheckBoxes');

  Widget _switches() => AdminFunctions.section([
        AdminFunctions.item(title: 'Switch Off', widget: AppSwitch(value: false, onChanged: (value) => null)),
        AdminFunctions.item(title: 'Switch ON', widget: AppSwitch(value: true, onChanged: (value) => null)),
      ], isRow: true, title: 'Switches');

  Widget _images() => AdminFunctions.section([
        AdminFunctions.item(title: 'Image Asset Height Restricted', multipleItems: [
          const AppImage(image: AppLogos.appLogo, size: Size.fromHeight(80)),
          const AppImage(image: AppLogos.developerLogo, size: Size.fromHeight(80)),
        ]),
        AdminFunctions.item(title: 'Image Asset Width Restricted', multipleItems: [
          const AppImage(image: AppLogos.appLogo, size: Size.fromWidth(50)),
          const AppImage(image: AppLogos.developerLogo, size: Size.fromWidth(50)),
        ]),
        AdminFunctions.item(title: 'Image Asset Rounded', multipleItems: [
          const AppImage(image: AppLogos.appLogo, size: Size.fromWidth(50), roundness: 20),
          const AppImage(image: AppLogos.developerLogo, size: Size.fromWidth(50), roundness: 20),
        ]),
      ], title: 'Images');

  Widget _progressIndicators() => AdminFunctions.section([
        AdminFunctions.item(title: 'AppProgressIndicator Circular', widget: AppProgressIndicator.circular()),
        AdminFunctions.item(title: 'AppProgressIndicator Linear', widget: AppProgressIndicator.linear()),
      ], title: 'Progress Indicators');

  Widget _alertDialogs() => AdminFunctions.section([
        AdminFunctions.item(
            widget: AppButton.general(
          text: 'Alert Dialog with OK',
          onTap: () => AppAlertDialogs.withOk(
              title: 'Alert Dialog Title', text: 'App Alert Dialog with Yes/No', onTapOk: popPage),
        )),
        AdminFunctions.item(
            widget: AppButton.general(
          text: 'Alert Dialog with Ok/Cancel',
          onTap: () => AppAlertDialogs.withOkCancel(
              title: 'Alert Dialog Title', text: 'App Alert Dialog with Ok/Cancel', onTapOk: popPage),
        )),
        AdminFunctions.item(
            widget: AppButton.general(
          text: 'Alert Dialog by Widget with OK',
          onTap: () => AppAlertWidgetDialogs()
              .withOk(title: 'Alert Dialog Title', widget: _alertDialogWidget(), onTapOk: popPage),
        )),
        AdminFunctions.item(
            widget: AppButton.general(
          text: 'Alert Dialog by Widget with Ok/Cancel',
          onTap: () => AppAlertWidgetDialogs()
              .withOkCancel(title: 'Alert Dialog Title', widget: _alertDialogWidget(), onTapOk: popPage),
        )),
      ], title: 'Alert Dialogs');

  Widget _alertDialogWidget() => Column(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(5, (index) => const Text('Some Widget').withTertiaryColor));

  Widget _bottomSheetDialog() {
    Widget form = Column(
        children: List<Widget>.generate(
            5,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text('App BottomSheet Dialog without Button').withTertiaryColor,
                )));

    return AdminFunctions.section([
      AdminFunctions.item(
          widget: AppButton.general(
        text: 'BottomSheet Dialog without Button',
        onTap: () => AppBottomSheet().withoutButton(title: 'BottomSheet Dialog', form: form, dismissible: true),
      )),
      AdminFunctions.item(
          widget: AppButton.general(
        text: 'BottomSheet Dialog with OK',
        onTap: () =>
            AppBottomSheet().withOk(title: 'BottomSheet Dialog', form: form, onTapOk: popPage, dismissible: true),
      )),
      AdminFunctions.item(
          widget: AppButton.general(
        text: 'BottomSheet Dialog with Cancel',
        onTap: () => AppBottomSheet().withCancel(title: 'BottomSheet Dialog', form: form, dismissible: true),
      )),
      AdminFunctions.item(
          widget: AppButton.general(
        text: 'BottomSheet Dialog with OK/Cancel',
        onTap: () =>
            AppBottomSheet().withOkCancel(title: 'BottomSheet Dialog', form: form, onTapOk: popPage, dismissible: true),
      )),
    ], title: 'BottomSheet Dialogs');
  }

  Widget _snackBars() => AdminFunctions.section([
        AdminFunctions.item(
            widget: AppButton.general(
                text: 'Simple Snackbar',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with LeadingText',
                    ))),
        AdminFunctions.item(
            widget: AppButton.general(
                text: 'Simple Snackbar with Title',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with LeadingText',
                      title: 'AppSnackBar Title',
                    ))),
        AdminFunctions.item(
            widget: AppButton.general(
                text: 'Snackbar with LeadingText',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with LeadingText',
                      title: 'AppSnackBar Title',
                      leadingText: 'Leading Text',
                      leadingAction: controller.functionCalledDialog,
                    ))),
        AdminFunctions.item(
            widget: AppButton.general(
                text: 'Snackbar with LeadingIcon',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with LeadingIcon',
                      title: 'AppSnackBar Title',
                      leadingIcon: AppIcons.info,
                      leadingAction: controller.functionCalledDialog,
                    ))),
        AdminFunctions.item(
            widget: AppButton.general(
                text: 'Snackbar with Button',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with Button',
                      title: 'AppSnackBar Title',
                      buttonText: 'Button',
                      buttonAction: controller.functionCalledDialog,
                    ))),
        AdminFunctions.item(
            widget: AppButton.general(
                text: 'Snackbar with Icon',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with Button',
                      title: 'AppSnackBar Title',
                      icon: AppIcons.settings,
                    ))),
        AdminFunctions.item(
            widget: AppButton.general(
                text: 'Snackbar with Progress Indicator',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with Progress Indicator',
                      title: 'AppSnackBar Title',
                      withProgressIndicator: true,
                    ))),
        AdminFunctions.item(
            widget: AppButton.general(
                text: 'Progress Indicator Snackbar',
                onTap: () => AppSnackBar.show(
                      title: 'Progress Indicator Snackbar Title',
                      widget: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: AppProgressIndicator.linear(),
                      ),
                    ))),
        AdminFunctions.item(
            widget: AppButton.general(
                text: 'Error Snackbar',
                onTap: () => AppSnackBar.showError(
                      message: 'App SnackBar with Button',
                      title: 'AppSnackBar Title',
                    ))),
        AdminFunctions.item(
            widget: AppButton.general(
                text: 'Warning Snackbar',
                onTap: () => AppSnackBar.showWarning(
                      message: 'App SnackBar with Button',
                      title: 'AppSnackBar Title',
                    ))),
      ], title: 'SnackBars');

  Widget _appBar() => AdminFunctions.section([
        AdminFunctions.item(
            fullWidth: true,
            widget: AppAppBar(
              pageDetail: AppPageDetail(pageRoute: AppPages.adminWidgetCheckPage.pageRoute, pageName: 'Page Name'),
              barLeading: AppButton.icon(icon: AppIcons.list, onTap: nullFunction),
              barAction: AppButton.icon(icon: AppIcons.add, onTap: nullFunction),
            )),
      ], title: 'AppBar');

  Widget _bottomNavigationBar() => AdminFunctions.section([
        AdminFunctions.item(
          fullWidth: true,
          widget: const AppBottomNavigationBar(selectedIndex: 0),
        )
      ], title: 'Bottom Navigation Bar');

  Widget _icons() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
              trackVisibility: true,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                      children: List<Widget>.generate(
                          AppIcons.values.length,
                          (index) => Padding(
                                padding: AppPaddings.pages,
                                child: AppIcons.values[index].widget.withSecondaryColor,
                              )))),
            ),
            fullWidth: true)
      ], title: 'Icons');
}
