import '../ui_kit_barrel.dart';
export '../ui_kit_barrel.dart';

class AppImage extends AppWidget {
  const AppImage({
    super.key,
    required this.image,
    this.padding,
    this.size,
    this.roundness,
    this.boxFit,
  });

  final String image;
  final EdgeInsets? padding;
  final Size? size;
  final double? roundness;
  final BoxFit? boxFit;

  @override
  Widget get widget => Container(
        constraints: BoxConstraints(maxWidth: size?.width ?? double.maxFinite, maxHeight: size?.height ?? double.maxFinite),
        padding: padding,
        child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(roundness ?? 0)), child: Image.asset(image, fit: boxFit ?? BoxFit.fill)),
      );
}
