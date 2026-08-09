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
  bool get enableBodyScroll => true;
  bool get enableAdaptiveLayout => true;

  @override
  Widget build(BuildContext context) {
    final page = PopScope(
      canPop: controller.pageDetail.bottomBarItemNumber == null,
      onPopInvokedWithResult: (didPop, result) => didPop == false ? appExitDialog() : null,
      child: Builder(builder: _buildScaffold),
    );
    return enableAdaptiveLayout ? AdaptiveHost(child: page) : page;
  }

  Widget _buildScaffold(BuildContext context) {
    final layout = enableAdaptiveLayout ? LayoutScope.maybeOf(context) : null;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar,
      drawer: drawer,
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: (layout?.width ?? Get.width) / 4,
      body: _pageBody(layout),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation ?? FloatingActionButtonLocation.endFloat,
      bottomSheet: bottomSheet,
      backgroundColor: AppColors.background.color,
    );
  }

  Widget _pageBody(LayoutModel? layout) {
    final padding = pagePadding;
    final content = padding == null ? body : Padding(padding: padding, child: body);
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
