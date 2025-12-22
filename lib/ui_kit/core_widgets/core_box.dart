import '../ui_kit_barrel.dart';
export '../ui_kit_barrel.dart';

class AppBox extends AppWidget {
  const AppBox._({super.key, this.child, this.width, this.height, this.shrink, this.flex});

  final Widget? child;
  final double? width;
  final double? height;
  final bool? shrink;
  final int? flex;

  factory AppBox({Widget? child, double? width, double? height}) => AppBox._(width: width, height: height, child: child);
  factory AppBox.shrink() => const AppBox._(shrink: true);
  factory AppBox.expanded({int? flex, Widget? child}) => AppBox._(flex: flex, child: child);
  factory AppBox.shrinkExpanded({int? flex}) => AppBox._(shrink: true, flex: flex);

  @override
  Widget get widget => flex == null ? _box : Expanded(flex: flex ?? 1, child: child ?? AppBox.shrink());

  Widget get _box => shrink == true
      ? const SizedBox.shrink()
      : SizedBox(
          width: width,
          height: height,
        );
}
