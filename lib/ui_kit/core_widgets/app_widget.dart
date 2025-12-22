import '../../boiler_plates/boiler_plate_ui_kit.dart';
export '../../boiler_plates/boiler_plate_ui_kit.dart';

abstract class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  Widget get widget;

  @override
  Widget build(BuildContext context) => widget;
}
