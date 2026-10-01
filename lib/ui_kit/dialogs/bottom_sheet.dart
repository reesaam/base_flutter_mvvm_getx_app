import '../../barrels/annotations_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

import 'bottom_sheet_widget.dart';

@GetPut.component()
class AppBottomSheet {
  static AppBottomSheet get to => Get.find();

  Future<T?> oneButton<T>({
    String? title,
    required String buttonText,
    Widget? widget,
    String? text,
    required Function() onTapButton,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [AppButton.general(text: buttonText, onTap: onTapButton)];
    var result = await AppBottomSheetWidget.appBottomSheetGeneral<T>(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
    return result;
  }

  Future<T?> twoButtons<T>({
    String? title,
    Widget? widget,
    String? text,
    required String buttonText1,
    required String buttonText2,
    required Function() onTapButton1,
    required Function() onTapButton2,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [AppButton.general(text: buttonText1, onTap: onTapButton1), AppButton.general(text: buttonText2, onTap: onTapButton2)];
    var result = await AppBottomSheetWidget.appBottomSheetGeneral<T>(title: title, widget: widget, buttons: buttons, dismissible: dismissible);
    return result;
  }

  Future<void> form({String? title, Widget? form, Widget? buttons, bool? dismissible}) async {
    await AppBottomSheetWidget.appBottomSheetGeneral(title: title, widget: form, buttons: buttons == null ? [] : [buttons], dismissible: dismissible);
  }

  // void tappableItem({required String text, required Function() onTap}) => LayoutBuilder(
  //   builder: (context, constraints) => InkWell(
  //     onTap: onTap,
  //     child: SizedBox(width: constraints.maxWidth, height: 50, child: Text(text)),
  //   ),
  // );


}
