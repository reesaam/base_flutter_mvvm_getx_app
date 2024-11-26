import 'package:flutter/material.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_elements/core_view.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../core/extensions/extensions_on_data_types/extension_icon.dart';
import '../../../core/extensions/extensions_on_material_widgets/extension_on_text.dart';
import '../../../ui_kit/buttons/app_general_button.dart';
import '../../../ui_kit/buttons/app_icon_button.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';
import '../../../ui_kit/dialogs/app_alert_widget_dialogs.dart';
import '../../../ui_kit/dialogs/app_bottom_dialogs.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_resources/logos.dart';
import '../../../core/core_resources/icons.dart';
import '../../../ui_kit/general_widgets/image.dart';
import '../../../ui_kit/general_widgets/popup_menu_item.dart';
import '../../../ui_kit/general_widgets/switch.dart';
import '../../../ui_kit/text_fields/text_field.dart';
import '../../../ui_kit/general_widgets/check_box.dart';
import '../../../ui_kit/general_widgets/dividers.dart';
import '../../../ui_kit/general_widgets/popup_menu.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/main_widgets/bottom_navigation_bar.dart';
import '../../../ui_kit/main_widgets/progress_indicator.dart';
import '../../../ui_kit/main_widgets/snackbar.dart';
import '../../../ui_kit/resources/paddings.dart';
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
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppDividers.generalWithDisabledColor,
        _dividers(),
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

  _dividers() => AdminFunctions.section([
        AdminFunctions.item(title: 'AppDividers General', widget: AppDividers.general()),
        AdminFunctions.item(primary: true, title: 'AppDividers General PrimaryColor', widget: AppDividers.generalWithPrimaryColor),
        AdminFunctions.item(title: 'AppDividers GeneralText', widget: AppDividers.generalWithInlineText(text: 'Some Text')),
        AdminFunctions.item(
            primary: true, title: 'AppDividers GeneralText PrimaryColor', widget: AppDividers.generalWithInlineText(text: 'Some Text')),
        AdminFunctions.item(title: 'AppDividers Settings', widget: AppDividers.settings),
      ], title: 'Dividers');

  _iconButtons() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'IconButton\nDefaultColor',
            widget: AppIconButton(
              icon: AppIcons.home,
              text: 'IconButton',
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            primary: true,
            title: 'IconButton\nPrimaryColor',
            widget: AppIconButton(
              icon: AppIcons.home,
              text: 'IconButton',
              primaryColor: true,
              onTap: controller.functionCalledDialog,
            )),
      ], isRow: true, title: 'Icon Buttons');

  _popUpMenu() => AdminFunctions.section([
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

  _textFields() {
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
          widget: AppTextField.general(controller: ctrl, hint: textFieldHint, leadingIcon: AppIcons.info)),
      AdminFunctions.item(
          title: 'TextField Editable with Prefix and Suffix',
          widget: AppTextField.general(
              controller: ctrl,
              hint: textFieldHint,
              prefixIcon: AppIcons.add,
              prefixAction: controller.functionCalledDialog,
              suffixIcon: AppIcons.settings,
              suffixAction: controller.functionCalledDialog)),
      AdminFunctions.item(
          title: 'TextField Not Editable',
          widget: AppTextField.general(
            editable: false,
            controller: ctrl,
            hasCounter: true,
            label: textFieldLabel,
            hint: textFieldHint,
            suffixIcon: AppIcons.settings,
            suffixAction: controller.functionCalledDialog,
          )),
      AdminFunctions.item(
        title: 'TextField with Data',
        widget: AppTextField.general(
          controller: ctrlWithData,
          hasCounter: true,
          hint: textFieldHint,
          suffixIcon: AppIcons.settings,
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
            suffixIcon: AppIcons.settings,
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

  _generalButtons() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'AppGeneralButton',
            widget: AppGeneralButton(
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon,
              leading: AppIcons.version,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            primary: true,
            title: 'AppGeneralButton PrimaryColor',
            widget: AppGeneralButton(
              primaryColor: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon,
              leading: AppIcons.version,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            title: 'AppGeneralButton Loading',
            widget: AppGeneralButton(
              loading: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon,
              leading: AppIcons.version,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            primary: true,
            title: 'AppGeneralButton Primary Loading',
            widget: AppGeneralButton(
              loading: true,
              primaryColor: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon,
              leading: AppIcons.version,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            title: 'AppGeneralButton Disabled',
            widget: AppGeneralButton(
              disabled: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon,
              leading: AppIcons.version,
              onTap: controller.functionCalledDialog,
            )),
      ], title: 'General Buttons');

  _checkBoxes() => AdminFunctions.section([
        AdminFunctions.item(title: 'AppCheckBox\nChecked', widget: AppCheckBox(value: true, onChanged: (value) => null)),
        AdminFunctions.item(title: 'AppCheckBox\nNot Checked', widget: AppCheckBox(value: false, onChanged: (value) => null)),
      ], isRow: true, title: 'CheckBoxes');

  _switches() => AdminFunctions.section([
        AdminFunctions.item(title: 'Switch Off', widget: AppSwitch(value: false, onChanged: (value) => null)),
        AdminFunctions.item(title: 'Switch ON', widget: AppSwitch(value: true, onChanged: (value) => null)),
      ], isRow: true, title: 'Switches');

  _images() => AdminFunctions.section([
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

  _progressIndicators() => AdminFunctions.section([
        AdminFunctions.item(title: 'AppProgressIndicator Circular', widget: AppProgressIndicator.circular()),
        AdminFunctions.item(title: 'AppProgressIndicator Linear', widget: AppProgressIndicator.linear()),
      ], title: 'Progress Indicators');

  _alertDialogs() => AdminFunctions.section([
        AdminFunctions.item(
            widget: AppGeneralButton(
          text: 'Alert Dialog with OK',
          onTap: () => AppAlertDialogs.withOk(title: 'Alert Dialog Title', text: 'App Alert Dialog with Yes/No', onTapOk: popPage),
        )),
        AdminFunctions.item(
            widget: AppGeneralButton(
          text: 'Alert Dialog with Ok/Cancel',
          onTap: () => AppAlertDialogs.withOkCancel(title: 'Alert Dialog Title', text: 'App Alert Dialog with Ok/Cancel', onTapOk: popPage),
        )),
        AdminFunctions.item(
            widget: AppGeneralButton(
          text: 'Alert Dialog by Widget with OK',
          onTap: () => AppAlertWidgetDialogs().withOk(title: 'Alert Dialog Title', widget: _alertDialogWidget(), onTapOk: popPage),
        )),
        AdminFunctions.item(
            widget: AppGeneralButton(
          text: 'Alert Dialog by Widget with Ok/Cancel',
          onTap: () => AppAlertWidgetDialogs().withOkCancel(title: 'Alert Dialog Title', widget: _alertDialogWidget(), onTapOk: popPage),
        )),
      ], title: 'Alert Dialogs');

  _alertDialogWidget() =>
      Column(mainAxisSize: MainAxisSize.min, children: List<Widget>.generate(5, (index) => const Text('Some Widget').withTertiaryColor));

  _bottomSheetDialog() {
    Widget form = Column(
        children: List<Widget>.generate(
            5,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text('App BottomSheet Dialog without Button').withTertiaryColor,
                )));

    return AdminFunctions.section([
      AdminFunctions.item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog without Button',
        onTap: () => AppBottomDialogs().withoutButton(title: 'BottomSheet Dialog', form: form, dismissible: true),
      )),
      AdminFunctions.item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog with OK',
        onTap: () => AppBottomDialogs().withOk(title: 'BottomSheet Dialog', form: form, onTapOk: popPage, dismissible: true),
      )),
      AdminFunctions.item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog with Cancel',
        onTap: () => AppBottomDialogs().withCancel(title: 'BottomSheet Dialog', form: form, dismissible: true),
      )),
      AdminFunctions.item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog with OK/Cancel',
        onTap: () => AppBottomDialogs().withOkCancel(title: 'BottomSheet Dialog', form: form, onTapOk: popPage, dismissible: true),
      )),
    ], title: 'BottomSheet Dialogs');
  }

  _snackBars() => AdminFunctions.section([
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Simple Snackbar',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with LeadingText',
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Simple Snackbar with Title',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with LeadingText',
                      title: 'AppSnackBar Title',
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Snackbar with LeadingText',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with LeadingText',
                      title: 'AppSnackBar Title',
                      leadingText: 'Leading Text',
                      leadingAction: controller.functionCalledDialog,
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Snackbar with LeadingIcon',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with LeadingIcon',
                      title: 'AppSnackBar Title',
                      leadingIcon: AppIcons.info,
                      leadingAction: controller.functionCalledDialog,
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Snackbar with Button',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with Button',
                      title: 'AppSnackBar Title',
                      buttonText: 'Button',
                      buttonAction: controller.functionCalledDialog,
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Snackbar with Icon',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with Button',
                      title: 'AppSnackBar Title',
                      icon: AppIcons.settings,
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Snackbar with Progress Indicator',
                onTap: () => AppSnackBar.show(
                      message: 'App SnackBar with Progress Indicator',
                      title: 'AppSnackBar Title',
                      withProgressIndicator: true,
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Progress Indicator Snackbar',
                onTap: () => AppSnackBar.show(
                      title: 'Progress Indicator Snackbar Title',
                      widget: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: AppProgressIndicator.linear(),
                      ),
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Error Snackbar',
                onTap: () => AppSnackBar.showError(
                      message: 'App SnackBar with Button',
                      title: 'AppSnackBar Title',
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Warning Snackbar',
                onTap: () => AppSnackBar.showWarning(
                      message: 'App SnackBar with Button',
                      title: 'AppSnackBar Title',
                    ))),
      ], title: 'SnackBars');

  _appBar() => AdminFunctions.section([
        AdminFunctions.item(
            fullWidth: true,
            widget: AppAppBar(
              pageDetail: AppPageDetail(pageRoute: AppPageDetails.adminWidgetCheckPage.pageRoute, pageName: 'Page Name'),
              barLeading: AppIconButton(icon: AppIcons.list, onTap: nullFunction),
              barAction: AppIconButton(icon: AppIcons.add, onTap: nullFunction),
            )),
      ], title: 'AppBar');

  _bottomNavigationBar() => AdminFunctions.section([
        AdminFunctions.item(
          fullWidth: true,
          widget: const AppBottomNavigationBar(selectedIndex: 0),
        )
      ], title: 'Bottom Navigation Bar');

  _icons() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
              trackVisibility: true,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                      children: List<Widget>.generate(
                          AppIcons.iconsList.length,
                          (index) => Padding(
                                padding: AppPaddings.pages,
                                child: AppIcons.iconsList[index].withSecondaryColor,
                              )))),
            ),
            fullWidth: true)
      ], title: 'Icons');
}
