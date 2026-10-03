import '../../barrels/ui_kit_barrel.dart';
import 'card_widget.dart';

class AppCard extends AppCardWidget {
  const AppCard.general({
    super.key,
    super.backgroundColorInput = AppColors.primary,
    super.borderColorInput = AppColors.transparent,
    super.surfaceTintColorInput,
    super.paddingInput,
    super.marginInput,
    super.shapeInput,
    super.elevationInput,
    super.clipBehaviourInput,
    super.semanticContainerInput,
    super.size,
    required super.childInput,
  });

  const AppCard.outline({
    super.key,
    super.backgroundColorInput = AppColors.background,
    super.borderColorInput = AppColors.primary,
    super.surfaceTintColorInput,
    super.paddingInput,
    super.marginInput,
    super.shapeInput,
    super.elevationInput,
    super.clipBehaviourInput,
    super.semanticContainerInput,
    super.size,
    required super.childInput,
  });
}
