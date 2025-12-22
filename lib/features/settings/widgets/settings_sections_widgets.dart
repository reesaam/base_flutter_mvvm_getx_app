import '../../../boiler_plates/boiler_plate_ui_kit.dart';
export '../../../boiler_plates/boiler_plate_ui_kit.dart';

import '../../../core/extensions/material_widgets_extensions/extension_text.dart';
import '../../../ui_kit/general_widgets/dividers.dart';

///Whole Widget
class SettingsSectionWidget extends AppWidget {
  final String title;
  final List<Widget> widgets;
  const SettingsSectionWidget({super.key, required this.title, required this.widgets});

  Widget _title(String text) => Text(text).withSizeBodyLarge.withDisabledColor;

  @override
  Widget get widget => Padding(
      padding: AppPaddings.settingsSection,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _title(title),
        AppDividers.settings,
        Column(children: widgets),
      ]));
}

///Items Widget
class SettingsSectionItemWidget extends StatelessWidget {
  final String text;
  final Widget? leading;
  final Function? wholeItemFunction;

  const SettingsSectionItemWidget({super.key, required this.text, this.leading, this.wholeItemFunction});

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: wholeItemFunction == null ? null : () => wholeItemFunction!(),
      child: Padding(
          padding: AppPaddings.settingsItem,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(text).withBodyLarge,
            leading ?? AppBox.shrink(),
          ])));
}
