import '../../../barrels/ui_kit_barrel.dart';

class AboutSectionWidget extends BaseWidget {
  final String titleText;
  final String itemText;
  const AboutSectionWidget({super.key, required this.titleText, required this.itemText});

  Widget _title() => Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text('$titleText:'));

  Widget _item() => LayoutBuilder(
    builder: (context, constraints) => Card(
      // color: AppColors.appPrimary,
      child: AppContainer(
        width: constraints.maxWidth,
        padding: const EdgeInsets.all(10),
        child: Text(
          itemText,
          // style: TextStyle(color: AppColors.textNormalLight)
        ),
      ),
    ),
  );

  @override
  Widget get widget => AppContainer(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_title(), _item()]),
  );
}
