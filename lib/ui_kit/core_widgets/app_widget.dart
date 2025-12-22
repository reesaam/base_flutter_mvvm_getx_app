import '../ui_kit_barrel.dart';
export '../ui_kit_barrel.dart';

abstract class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  Widget get widget;

  @override
  Widget build(BuildContext context) => widget;
}
