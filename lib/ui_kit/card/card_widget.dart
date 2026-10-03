import '../../barrels/ui_kit_barrel.dart';
import '../../core/core_resources/defaults.dart';

class AppCardWidget extends Card {
  const AppCardWidget({
    super.key,
    this.backgroundColorInput,
    this.borderColorInput,
    this.surfaceTintColorInput,
    this.paddingInput,
    this.marginInput,
    this.shapeInput,
    this.elevationInput,
    this.clipBehaviourInput,
    this.semanticContainerInput,
    this.size,
    required this.childInput,
  });

  final AppColors? backgroundColorInput;
  final AppColors? borderColorInput;
  final AppColors? surfaceTintColorInput;
  final Widget childInput;
  final AppPaddings? paddingInput;
  final AppPaddings? marginInput;
  final ShapeBorder? shapeInput;
  final double? elevationInput;
  final Clip? clipBehaviourInput;
  final bool? semanticContainerInput;
  final Size? size;

  @override
  Widget? get child => AppContainer(
    width: size?.width,
    height: size?.height,
    color: AppColors.transparent,
    decoration: AppElements.boxDecoration(color: backgroundColorInput, inputBoxBorder: AppElements.boxBorderError()),
    padding: paddingInput ?? AppPaddings.zero,
    child: childInput,
  );

  @override
  Color? get color => (backgroundColorInput ?? AppColors.background).color;

  @override
  Color? get surfaceTintColor => surfaceTintColorInput?.color;

  @override
  EdgeInsetsGeometry? get margin => marginInput;

  @override
  ShapeBorder? get shape => shapeInput;

  @override
  double? get elevation => elevationInput ?? AppDefaults.elevation;

  @override
  Clip? get clipBehavior => clipBehaviourInput;

  @override
  bool get semanticContainer => semanticContainerInput ?? false;
}
