import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';
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
  AppPaddings? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AppDividers.general(),
      _dividers(),
      _appCards(),
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
    ],
  );

  Widget _dividers() => AdminFunctions.section([
    AdminFunctions.item(title: 'AppDividers General', widget: AppDividers.general()),
    AdminFunctions.item(primary: true, title: 'AppDividers General PrimaryColor', widget: AppDividers.general()),
    AdminFunctions.item(
      title: 'AppDividers GeneralText',
      widget: AppDividers.generalWithInlineText(text: 'Some Text'),
    ),
    AdminFunctions.item(
      primary: true,
      title: 'AppDividers GeneralText PrimaryColor',
      widget: AppDividers.generalWithInlineText(text: 'Some Text'),
    ),
    AdminFunctions.item(title: 'AppDividers Settings', widget: AppDividers.settings),
  ], title: 'Dividers');

  Widget _appBoxes() {
    Widget _innerChild = Text('AppBox Child');

    return AdminFunctions.section(
      [
        AdminFunctions.item(
          title: 'AppBox',
          widget: AppBox(child: _innerChild),
        ),
        AdminFunctions.item(
          title: 'AppBox Expanded',
          widget: AppContainer(
            color: AppColors.disabled,
            child: AppBox.expanded(child: _innerChild),
          ),
        ),
      ],
      isRow: false,
      title: 'App Boxes',
    );
  }

  Widget _appCards() {
    return AdminFunctions.section(
      [
        AdminFunctions.item(
          title: 'AppCard General',
          widget: AppCard.general(size: Size(100, 100), childInput: Text('Card Child').copyWith(textColor: AppColors.background)),
        ),
        AdminFunctions.item(
          title: 'AppCard Outline',
          widget: AppCard.outline(size: Size(100, 100), childInput: Text('Card Child').copyWith(textColor: AppColors.primary)),
        ),
      ],
      isRow: true,
      title: 'App Cards',
    );
  }

  Widget _iconButtons() => AdminFunctions.section(
    [
      AdminFunctions.item(
        title: 'IconButton\nDefaultColor',
        widget: AppButton.icon(
          icon: AppIcons.home,
          // text: 'IconButton',
          onTap: controller.functionCalledDialog,
        ),
      ),
      AdminFunctions.item(
        primary: true,
        title: 'IconButton\nPrimaryColor',
        widget: AppButton.icon(icon: AppIcons.home, onTap: controller.functionCalledDialog),
      ),
    ],
    isRow: true,
    title: 'Icon Buttons',
  );

  Widget _popUpMenu() => AdminFunctions.section(
    [
      AdminFunctions.item(
        title: 'Popup Menu\nDefaultColor',
        widget: AppPopupMenu(
          listItems: List<AppPopupMenuItem>.generate(
            5,
            (index) => AppPopupMenuItem(text: 'Popup Menu Item', onTapFunction: controller.functionCalledDialog),
          ),
        ),
      ),
      AdminFunctions.item(
        title: 'Popup Menu\nPrimaryColor',
        primary: true,
        widget: AppPopupMenu(
          listItems: List<AppPopupMenuItem>.generate(
            5,
            (index) => AppPopupMenuItem(text: 'Popup Menu Item', onTapFunction: controller.functionCalledDialog),
          ),
        ),
      ),
    ],
    isRow: true,
    title: 'Popup Menu',
  );

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
        title: 'TextField Data',
        widget: AppTextField.general(controller: ctrlWithData),
      ),
      AdminFunctions.item(
        title: 'TextField Label',
        widget: AppTextField.general(controller: ctrl, labelText: textFieldLabel),
      ),
      AdminFunctions.item(
        title: 'TextField Hint',
        widget: AppTextField.general(controller: ctrl, hintText: textFieldHint),
      ),
      AdminFunctions.item(
        title: 'TextField Editable with Leading Icon',
        widget: AppTextField.general(controller: ctrl, hintText: textFieldHint, leadingIcon: AppIcons.info.widget),
      ),
      AdminFunctions.item(
        title: 'TextField Editable with Prefix and Suffix',
        widget: AppTextField.general(
          controller: ctrl,
          hintText: textFieldHint,
          prefixIcon: AppIcons.add.widget,
          prefixAction: controller.functionCalledDialog,
          suffixIcon: AppIcons.settings.widget,
          suffixAction: controller.functionCalledDialog,
        ),
      ),
      AdminFunctions.item(
        title: 'TextField Not Editable',
        widget: AppTextField.general(
          editable: false,
          controller: ctrl,
          hasCounter: true,
          labelText: textFieldLabel,
          hintText: textFieldHint,
          suffixIcon: AppIcons.settings.widget,
          suffixAction: controller.functionCalledDialog,
        ),
      ),
      AdminFunctions.item(
        title: 'TextField with Data',
        widget: AppTextField.general(
          controller: ctrlWithData,
          hasCounter: true,
          hintText: textFieldHint,
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
          labelText: textFieldLabel,
          hintText: textFieldHint,
          suffixIcon: AppIcons.settings.widget,
          suffixAction: controller.functionCalledDialog,
        ),
      ),
      AdminFunctions.item(
        title: 'TextField Whole Widget Function',
        widget: AppTextField.general(
          controller: ctrl,
          labelText: textFieldLabel,
          hintText: textFieldHint,
          wholeWidgetAction: controller.functionCalledDialog,
        ),
      ),
      AdminFunctions.item(
        title: 'TextField with Error',
        widget: AppTextField.general(controller: ctrlWithData, labelText: textFieldLabel, hintText: textFieldHint, errorText: 'Error'),
      ),
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
      ),
    ),
    AdminFunctions.item(
      primary: true,
      title: 'AppGeneralButton PrimaryColor',
      widget: AppButton.general(
        text: 'AppGeneralButton',
        icon: AppIcons.adminPanel,
        leading: AppIcons.version,
        onTap: controller.functionCalledDialog,
      ),
    ),
    AdminFunctions.item(
      title: 'AppGeneralButton Loading',
      widget: AppButton.general(
        loading: true,
        text: 'AppGeneralButton',
        icon: AppIcons.adminPanel,
        leading: AppIcons.version,
        onTap: controller.functionCalledDialog,
      ),
    ),
    AdminFunctions.item(
      primary: true,
      title: 'AppGeneralButton Primary Loading',
      widget: AppButton.general(
        loading: true,
        text: 'AppGeneralButton',
        icon: AppIcons.adminPanel,
        leading: AppIcons.version,
        onTap: controller.functionCalledDialog,
      ),
    ),
    AdminFunctions.item(
      title: 'AppGeneralButton Disabled',
      widget: AppButton.general(
        disabled: true,
        text: 'AppGeneralButton',
        icon: AppIcons.adminPanel,
        leading: AppIcons.version,
        onTap: controller.functionCalledDialog,
      ),
    ),
  ], title: 'General Buttons');

  Widget _checkBoxes() => AdminFunctions.section(
    [
      AdminFunctions.item(
        title: 'AppCheckBox\nChecked',
        widget: AppCheckBox(value: true, onChanged: (value) => null),
      ),
      AdminFunctions.item(
        title: 'AppCheckBox\nNot Checked',
        widget: AppCheckBox(value: false, onChanged: (value) => null),
      ),
    ],
    isRow: true,
    title: 'CheckBoxes',
  );

  Widget _switches() => AdminFunctions.section(
    [
      AdminFunctions.item(
        title: 'Switch Off',
        widget: AppSwitch(value: false, onChanged: (value) => null),
      ),
      AdminFunctions.item(
        title: 'Switch ON',
        widget: AppSwitch(value: true, onChanged: (value) => null),
      ),
    ],
    isRow: true,
    title: 'Switches',
  );

  Widget _images() => AdminFunctions.section([
    AdminFunctions.item(
      title: 'Image Asset Height Restricted',
      multipleItems: [
        const AppImage(image: AppLogos.appLogo, size: Size.fromHeight(80)),
        const AppImage(image: AppLogos.developerLogo, size: Size.fromHeight(80)),
      ],
    ),
    AdminFunctions.item(
      title: 'Image Asset Width Restricted',
      multipleItems: [
        const AppImage(image: AppLogos.appLogo, size: Size.fromWidth(50)),
        const AppImage(image: AppLogos.developerLogo, size: Size.fromWidth(50)),
      ],
    ),
    AdminFunctions.item(
      title: 'Image Asset Rounded',
      multipleItems: [
        const AppImage(image: AppLogos.appLogo, size: Size.fromWidth(50), roundness: 20),
        const AppImage(image: AppLogos.developerLogo, size: Size.fromWidth(50), roundness: 20),
      ],
    ),
  ], title: 'Images');

  Widget _progressIndicators() => AdminFunctions.section([
    AdminFunctions.item(title: 'AppProgressIndicator Circular', widget: AppProgressIndicator.circular()),
    AdminFunctions.item(title: 'AppProgressIndicator Linear', widget: AppProgressIndicator.linear()),
  ], title: 'Progress Indicators');

  Widget _alertDialogs() => AdminFunctions.section([
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Alert Dialog with OK',
        onTap: () => AppAlertDialogs.to.oneButton(
          buttonText: Texts.to.general.ok,
          title: 'Alert Dialog Title',
          text: 'App Alert Dialog with Yes/No',
          onTapButton: popPage,
        ),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Alert Dialog with Ok/Cancel',
        onTap: () => AppAlertDialogs.to.twoButtons(
          buttonText1: Texts.to.general.ok,
          buttonText2: Texts.to.general.cancel,
          title: 'Alert Dialog Title',
          text: 'App Alert Dialog with Ok/Cancel',
          onTapButton1: popPage<String>,
          onTapButton2: popPage<String>,
        ),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Alert Dialog by Widget with OK',
        onTap: () => AppAlertDialogs.to.oneButton(
          buttonText: Texts.to.general.ok,
          title: 'Alert Dialog Title',
          widget: _alertDialogWidget(),
          onTapButton: popPage,
        ),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Alert Dialog by Widget with Ok/Cancel',
        onTap: () => AppAlertDialogs.to.twoButtons(
          buttonText1: Texts.to.general.ok,
          buttonText2: Texts.to.general.cancel,
          title: 'Alert Dialog Title',
          widget: _alertDialogWidget(),
          onTapButton1: popPage,
          onTapButton2: popPage,
        ),
      ),
    ),
  ], title: 'Alert Dialogs');

  Widget _alertDialogWidget() => Column(
    mainAxisSize: MainAxisSize.min,
    children: List<Widget>.generate(5, (index) => const Text('Some Widget').copyWith(textColor: AppColors.tertiary)),
  );

  Widget _bottomSheetDialog() {
    Widget form = Column(
      children: List<Widget>.generate(
        5,
        (index) => Padding(
          padding: const AppPaddings.symmetric(vertical: 10),
          child: const Text('App BottomSheet Dialog without Button').copyWith(textColor: AppColors.tertiary),
        ),
      ),
    );

    return AdminFunctions.section([
      AdminFunctions.item(
        widget: AppButton.general(
          text: 'BottomSheet Dialog without Button',
          onTap: () => AppBottomSheet.to.form(title: 'BottomSheet Dialog', form: form, dismissible: true),
        ),
      ),
      AdminFunctions.item(
        widget: AppButton.general(
          text: 'BottomSheet Dialog with OK',
          onTap: () => AppBottomSheet.to.oneButton(
            title: 'BottomSheet Dialog',
            buttonText: Texts.to.general.ok,
            onTapButton: popPage,
            widget: form,
            dismissible: true,
          ),
        ),
      ),
      AdminFunctions.item(
        widget: AppButton.general(
          text: 'BottomSheet Dialog with Cancel',
          onTap: () => AppBottomSheet.to.oneButton(
            title: 'BottomSheet Dialog',
            buttonText: Texts.to.general.cancel,
            onTapButton: popPage,
            widget: form,
            dismissible: true,
          ),
        ),
      ),
      AdminFunctions.item(
        widget: AppButton.general(
          text: 'BottomSheet Dialog with OK/Cancel',
          onTap: () => AppBottomSheet.to.twoButtons(
            title: 'BottomSheet Dialog',
            buttonText1: Texts.to.general.ok,
            onTapButton1: popPage,
            buttonText2: Texts.to.general.cancel,
            onTapButton2: popPage,
            widget: form,
            dismissible: true,
          ),
        ),
      ),
    ], title: 'BottomSheet Dialogs');
  }

  Widget _snackBars() => AdminFunctions.section([
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Simple Snackbar',
        onTap: () => AppSnackBar.general(messageInput: 'App SnackBar with LeadingText').show(),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Simple Snackbar with Title',
        onTap: () => AppSnackBar.general(messageInput: 'App SnackBar with LeadingText', titleInput: 'AppSnackBar Title').show(),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Snackbar with LeadingText',
        onTap: () => AppSnackBar.general(
          messageInput: 'App SnackBar with LeadingText',
          titleInput: 'AppSnackBar Title',
          leadingTextInput: 'Leading Text',
          leadingActionInput: controller.functionCalledDialog,
        ).show(),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Snackbar with LeadingIcon',
        onTap: () => AppSnackBar.general(
          messageInput: 'App SnackBar with LeadingIcon',
          titleInput: 'AppSnackBar Title',
          leadingIconInput: AppIcons.info,
          leadingActionInput: controller.functionCalledDialog,
        ).show(),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Snackbar with Button',
        onTap: () => AppSnackBar.general(
          messageInput: 'App SnackBar with Button',
          titleInput: 'AppSnackBar Title',
          buttonTextInput: 'Button',
          buttonActionInput: controller.functionCalledDialog,
        ).show(),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Snackbar with Icon',
        onTap: () =>
            AppSnackBar.general(messageInput: 'App SnackBar with Button', titleInput: 'AppSnackBar Title', iconInput: AppIcons.settings).show(),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Snackbar with Progress Indicator',
        onTap: () => AppSnackBar.general(
          messageInput: 'App SnackBar with Progress Indicator',
          titleInput: 'AppSnackBar Title',
          showProgressIndicatorInput: true,
        ).show(),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Progress Indicator Snackbar',
        onTap: () => AppSnackBar.general(
          titleInput: 'Progress Indicator Snackbar Title',
          widgetInput: Padding(padding: const AppPaddings.only(top: 20), child: AppProgressIndicator.linear()),
        ).show(),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Error Snackbar',
        onTap: () => AppSnackBar.error(messageInput: 'App SnackBar with Button', titleInput: 'AppSnackBar Title').show(),
      ),
    ),
    AdminFunctions.item(
      widget: AppButton.general(
        text: 'Warning Snackbar',
        onTap: () => AppSnackBar.warning(messageInput: 'App SnackBar with Button', titleInput: 'AppSnackBar Title').show(),
      ),
    ),
  ], title: 'SnackBars');

  Widget _appBar() => AdminFunctions.section([
    AdminFunctions.item(
      fullWidth: true,
      widget: AppAppBar(
        pageDetail: AppPageDetail(pageRoute: AppPages.adminWidgetCheckPage.pageRoute, pageName: 'Page Name'),
        // barLeading: AppButton.icon(icon: AppIcons.list, onTap: nullFunction),
        // barAction: AppButton.icon(icon: AppIcons.add, onTap: nullFunction),
      ),
    ),
    AdminFunctions.item(
      fullWidth: true,
      widget: AppAppBar(
        pageDetail: AppPageDetail(pageRoute: AppPages.adminWidgetCheckPage.pageRoute, pageName: 'Page Name'),
        barLeading: AppButton.icon(icon: AppIcons.list, onTap: nullFunction),
      ),
    ),
    AdminFunctions.item(
      fullWidth: true,
      widget: AppAppBar(
        pageDetail: AppPageDetail(pageRoute: AppPages.adminWidgetCheckPage.pageRoute, pageName: 'Page Name'),
        barAction: AppButton.icon(icon: AppIcons.add, onTap: nullFunction),
      ),
    ),
    AdminFunctions.item(
      fullWidth: true,
      widget: AppAppBar(
        pageDetail: AppPageDetail(pageRoute: AppPages.adminWidgetCheckPage.pageRoute, pageName: 'Page Name'),
        barLeading: AppButton.icon(icon: AppIcons.list, onTap: nullFunction),
        barAction: AppButton.icon(icon: AppIcons.add, onTap: nullFunction),
      ),
    ),
  ], title: 'AppBar');

  Widget _bottomNavigationBar() => AdminFunctions.section([
    AdminFunctions.item(fullWidth: true, widget: const AppBottomNavigationBar(selectedIndex: 0)),
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
              (index) => Padding(padding: AppPaddings.pages, child: AppIcons.values[index].widget),
            ),
          ),
        ),
      ),
      fullWidth: true,
    ),
  ], title: 'Icons');
}
