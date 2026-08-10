import '../../barrels/ui_kit_barrel.dart';

class AppButtonLoading extends BaseWidget {
  const AppButtonLoading({super.key, this.color, this.width, this.strokeWidth});

  final AppColors? color;
  final double? width;
  final double? strokeWidth;

  @override
  Widget get widget => AppProgressIndicator.circular(color: color?.color ?? Get.theme.canvasColor, width: width ?? 20, strokeWidth: strokeWidth ?? 3);
}
