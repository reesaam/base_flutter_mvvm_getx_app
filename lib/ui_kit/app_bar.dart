import '../barrels/localization_barrel.dart';
import '../barrels/shared_models_barrel.dart';
import '../barrels/ui_kit_barrel.dart';

class AppAppBar extends AppBar {
  AppAppBar({super.key, required this.pageDetail, this.withOutTitle, this.barTitle, this.barLeading, this.barAction, this.height}) : super();

  final AppPageDetail pageDetail;
  final bool? withOutTitle;
  final Widget? barTitle;
  final Widget? barLeading;
  final Widget? barAction;
  final double? height;

  @override
  Color? get backgroundColor => AppColors.appBarBackground.color;

  @override
  IconThemeData? get iconTheme => Get.theme.iconTheme;

  @override
  Widget? get title => withOutTitle == true ? null : barTitle ?? _normalTextTitle;

  @override
  Widget? get leading => barLeading;

  @override
  List<Widget>? get actions => [barAction ?? AppBox.shrink()];
  // List<Widget>? get actions => [barAction ?? AppBox.shrink()];

  @override
  bool? get centerTitle => true;

  @override
  double? get toolbarHeight => height;

  Widget get _normalTextTitle => Text(
    pageDetail.pageName ?? Texts.to.general.empty,
    style: Get.theme.textTheme.titleSmall,
  ).copyWith(textColor: AppColors.appBarForeground);
}
