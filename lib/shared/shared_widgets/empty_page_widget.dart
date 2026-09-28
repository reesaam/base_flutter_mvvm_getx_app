import '../../barrels/extensions_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/shared_models_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class EmptyPageWidget extends BaseWidget {
  const EmptyPageWidget({super.key, required this.page});

  final AppPageDetail page;

  @override
  Widget get widget => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [page.iconCode.toIcon().copyWith(size: AppSizes.emptyPageIcon, color: AppColors.primary.color), AppSpaces.h20, Text(Texts.to.general.emptyPage).withSizeDisplayLarge],
  );
}
