import '../../barrels/core_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';
import 'core_controller.dart';

abstract class CoreView<Controller extends CoreController> extends GetView<Controller> {
  const CoreView({super.key});

  PreferredSizeWidget? get appBar => null;

  Widget? get drawer => null;

  Widget get body;

  Widget? get bottomNavigationBar => null;

  Widget? get floatingActionButton => null;

  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  Widget? get bottomSheet => null;

  EdgeInsets? get pagePadding => null;

  /// When true, body is wrapped in [SingleChildScrollView] without a leaked controller.
  bool get enableBodyScroll => true;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: controller.pageDetail.bottomBarItemNumber == null,
        onPopInvokedWithResult: (didPop, result) => didPop == false ? appExitDialog() : null,
        child: _pageScaffold,
      );

  Widget get _pageScaffold => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        drawer: drawer,
        drawerEnableOpenDragGesture: true,
        drawerEdgeDragWidth: Get.width / 4,
        body: _pageBody,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation ?? FloatingActionButtonLocation.endFloat,
        bottomSheet: bottomSheet,
        backgroundColor: AppColors.background.color,
      );

  Widget get _pageBody {
    final content = pagePadding == null ? body : Padding(padding: pagePadding!, child: body);
    return SafeArea(
      child: enableBodyScroll
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: content,
            )
          : content,
    );
  }
}
