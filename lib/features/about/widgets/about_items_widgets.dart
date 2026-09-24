import '../../../barrels/ui_kit_barrel.dart';

import '../models/about_item_model.dart';

class AboutSectionWidget extends BaseWidget {
  final AboutItemModel item;
  const AboutSectionWidget({super.key, required this.item});

  Widget _title() => Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text('${item.title}:'));

  Widget _item() => LayoutBuilder(
    builder: (context, constraints) => Card(
      // color: AppColors.appPrimary,
      child: AppContainer(
        width: constraints.maxWidth,
        padding: const EdgeInsets.all(10),
        child: Text(
          item.value,
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
