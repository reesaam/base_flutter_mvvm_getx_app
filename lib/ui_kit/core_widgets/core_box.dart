import '../../barrels/ui_kit_barrel.dart';

class AppBox extends BaseWidget {
  const AppBox._({this.child, this.width, this.height, this.shrink, this.flex, this.expanded});

  final Widget? child;
  final double? width;
  final double? height;
  final bool? shrink;
  final int? flex;
  final bool? expanded;

  factory AppBox({Widget? child, double? width, double? height}) =>
      AppBox._(width: width, height: height, child: child);

  factory AppBox.shrink() => const AppBox._(shrink: true);

  factory AppBox.expanded({int? flex, Widget? child}) => AppBox._(child: child, expanded: true, flex: flex);

  factory AppBox.shrinkExpanded({int? flex}) => AppBox._(shrink: true, expanded: true, flex: flex);

  @override
  Widget get widget => shrink == true
      ? const SizedBox.shrink()
      : expanded == true
          ? _expandedBox
          : _box;

  Widget get _box => SizedBox(
        width: width,
        height: height,
        child: child,
      );

  Widget get _expandedBox => Expanded(
        flex: flex ?? 1,
        child: _box,
      );
}
