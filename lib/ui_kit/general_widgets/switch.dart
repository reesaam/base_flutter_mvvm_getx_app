import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/sizes.dart';
import '../theme/themes.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({super.key, required this.value, required this.onChanged, this.enabled});

  final bool? value;
  final Function? onChanged;
  final bool? enabled;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: AppSizes.switchHeight.height,
      child: Switch.adaptive(
        value: value == true ? true : false,
        onChanged: (value) => onChanged!(value),
        focusNode: FocusNode(canRequestFocus: enabled == false ? false : true),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        activeTrackColor: Get.theme.primaryColor,
        inactiveTrackColor: Get.theme.canvasColor,
        inactiveThumbColor: Get.theme.primaryColor,
      ));
}
