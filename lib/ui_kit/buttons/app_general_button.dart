import 'package:flutter/material.dart';

import '../core_widgets.dart';
import '../main_widgets/progress_indicator.dart';
import '../theme/themes.dart';

class AppGeneralButton extends ElevatedButton {
  const AppGeneralButton({
    super.key,
    super.child,
    super.onPressed,
    required this.text,
    required this.onTap,
    this.textSize,
    this.icon,
    this.leading,
    this.disabled,
    this.primaryColor,
    this.onSecondaryColor,
    this.loading,
    this.stateController,
  });

  final String text;
  final double? textSize;
  final Function onTap;
  final Icon? icon;
  final Icon? leading;
  final bool? disabled;
  final bool? primaryColor;
  final bool? onSecondaryColor;
  final bool? loading;
  final MaterialStatesController? stateController;

  @override
  Widget? get child {
    List<Widget> children = loading == true
        ? [_buttonLoading]
        : [
            icon ?? shrinkSizedBox,
            Expanded(child: Center(child: Text(text, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, softWrap: true))),
            leading ?? shrinkSizedBox,
          ];
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: children);
  }

  @override
  VoidCallback? get onPressed => () => disabled == true || loading == true ? null : onTap();

  @override
  MaterialStatesController? get statesController =>
      stateController ??
      (disabled == true
          ? MaterialStatesController(<MaterialState>{MaterialState.focused})
          : MaterialStatesController(<MaterialState>{MaterialState.disabled}));

  Widget get _buttonLoading => AppProgressIndicator.circular(
        color: AppThemes.to.canvasColor,
        width: 20,
        strokeWidth: 3,
      );
}
