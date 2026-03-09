import '../barrels/core_barrel.dart';
import '../barrels/core_resources_barrel.dart' hide State;
import '../barrels/extensions_barrel.dart';
import '../barrels/localization_barrel.dart';
import '../barrels/shared_models_barrel.dart';
import '../barrels/ui_kit_barrel.dart' hide State;

class AppBottomNavigationBar extends StatefulWidget {
  final int? selectedIndex;
  const AppBottomNavigationBar({super.key, this.selectedIndex});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  RxInt selectedIndex = 0.obs;
  List<AppPageDetail> pagesList = AppPages.listPages.where((element) => element.bottomBarItemNumber != null).toList();

  @override
  void initState() {
    pagesList.sort((a, b) => a.bottomBarItemNumber!.compareTo(b.bottomBarItemNumber!));
    super.initState();
  }

  void _onItemTap(int index) {
    selectedIndex.value = index;
    goToPage(pagesList[index]);
  }

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        backgroundColor: AppColors.bottomNavigationBarBackground.color,
        currentIndex: selectedIndex.value = widget.selectedIndex ?? 0,
        onTap: (index) => _onItemTap(index),
        items: List<BottomNavigationBarItem>.generate(
          pagesList.length,
          (index) => _generateBottomNavigationBarItem(pagesList[index]),
        ),
        selectedItemColor: AppColors.bottomNavigationBarForeground.color,
        unselectedItemColor: AppColors.bottomNavigationBarForeground.color.lowOpacity,
      );

  BottomNavigationBarItem _generateBottomNavigationBarItem(AppPageDetail route) => BottomNavigationBarItem(
        icon: _createIcon(route),
        label: _createLabel(route),
      );

  Icon _createIcon(AppPageDetail route) =>
      pagesList.singleWhere((element) => element.pageRoute == route.pageRoute).iconCode.toIcon();

  String _createLabel(AppPageDetail route) =>
      pagesList.singleWhere((element) => element.pageRoute == route.pageRoute).pageName ?? Texts.to.general.empty;
}
