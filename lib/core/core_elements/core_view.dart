import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui_kit/resources/paddings.dart';
import '../../ui_kit/theme/themes.dart';
import '../core_functions.dart';
import '../../ui_kit/core_widgets.dart';
import 'core_controller.dart';

abstract class CoreView<Controller extends CoreController> extends GetView<Controller> {
  const CoreView({super.key});

  ///Main Widgets
  PreferredSizeWidget? get appBar => null;
  Widget? get drawer => null;
  Widget get body;
  Widget? get header => null;
  Widget? get footer => null;
  Widget? get bottomNavigationBar => null;
  Widget? get floatingActionButton => null;
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;
  Widget? get bottomSheet => null;
  bool get scrollable => true;

  ///Variables
  EdgeInsets? get pagePadding => null;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: controller.pageDetail.bottomBarItemNumber == null,
        onPopInvoked: (didPop) => didPop == false ? appExitDialog() : null,
        child: _pageScaffold,
      );

  Widget get _pageScaffold => Scaffold(
        backgroundColor: AppThemes.to.canvasColor,
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
      );

  Widget get _pageBody => SafeArea(
        child: Column(children: [
          header ?? shrinkSizedBox,
          //Main Body
          Expanded(
              child: Padding(
                  padding: pagePadding ?? AppPaddings.pages,
                  child: scrollable
                      ? SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          child: body,
                        )
                      : body)),
          footer ?? shrinkSizedBox,
        ]),
      );
}
