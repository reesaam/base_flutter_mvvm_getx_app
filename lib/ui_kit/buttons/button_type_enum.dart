import '../../barrels/ui_kit_barrel.dart';

enum ButtonType {
  general(backgroundColor: AppColors.background, textColor: AppColors.secondary),
  icon,
  filled,
  outlined;

  final AppColors? backgroundColor;
  final AppColors? textColor;

  const ButtonType({this.backgroundColor, this.textColor});
}
