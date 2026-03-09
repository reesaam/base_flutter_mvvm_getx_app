import '../barrels/localization_barrel.dart';
import '../barrels/shared_models_barrel.dart';
import '../barrels/ui_kit_barrel.dart';

class AppAppBar extends AppBar {
  AppAppBar({
    super.key,
    required this.pageDetail,
    this.withOutTitle,
    this.barTitle,
    this.barLeading,
    this.barAction,
  }) : super();

  final AppPageDetail pageDetail;
  final bool? withOutTitle;
  final Widget? barTitle;
  final Widget? barLeading;
  final Widget? barAction;

  @override
  Widget? get title => withOutTitle == true ? null : barTitle ?? _normalTextTitle;

  @override
  Widget? get leading => barLeading;

  @override
  List<Widget>? get actions => [
        Padding(
          padding: AppPaddings.appBarActions,
          child: barAction,
        )
      ];

  @override
  bool? get centerTitle => true;

  Widget get _normalTextTitle => Text(pageDetail.pageName ?? Texts.to.general.empty, style: Get.theme.textTheme.titleSmall)
      .withColor(Get.theme.appBarTheme.foregroundColor ?? Get.theme.canvasColor);
}
