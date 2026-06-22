import '../../barrels/ui_kit_barrel.dart';
import 'button_loading.dart';

class AppButtonWidget extends ElevatedButton {
  const AppButtonWidget({
    super.key,
    super.child,
    super.onPressed,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.borderColor,
    this.loadingColor,
    this.childWidget,
    this.loadingWidget,
    this.textSize,
    this.icon,
    this.leading,
    this.disabled,
    this.loading,
    this.stateController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.textAlign,
    this.textOverflow,
    this.softWrap,
  });

  final String text;
  final double? textSize;
  final Function onTap;
  final AppColors? backgroundColor;
  final AppColors? textColor;
  final AppColors? iconColor;
  final AppColors? borderColor;
  final AppColors? loadingColor;
  final Widget? childWidget;
  final Widget? loadingWidget;
  final AppIcons? icon;
  final AppIcons? leading;
  final bool? disabled;
  final bool? loading;
  final WidgetStatesController? stateController;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final bool? softWrap;

  @override
  Widget? get child {
    List<Widget> children = loading == true
        ? [loadingWidget ?? AppButtonLoading(color: loadingColor)]
        : [
            icon?.widget ?? AppBox.shrink(),
            AppBox.expanded(
                child: Center(
                    child: Text(
              text,
              textAlign: textAlign ?? TextAlign.center,
              overflow: textOverflow ?? TextOverflow.ellipsis,
              softWrap: softWrap ?? true,
            ))),
            leading?.widget ?? AppBox.shrink(),
          ];
    return Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceAround,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: children);
  }

  @override
  VoidCallback? get onPressed => () => disabled == true || loading == true ? null : onTap();

  @override
  WidgetStatesController? get statesController =>
      stateController ??
      (disabled == true
          ? WidgetStatesController(<WidgetState>{WidgetState.focused})
          : WidgetStatesController(<WidgetState>{WidgetState.disabled}));
}
