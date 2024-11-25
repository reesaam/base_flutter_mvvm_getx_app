import 'package:flutter/material.dart';

class AboutSectionWidget extends StatelessWidget {
  final String titleText;
  final String itemText;
  const AboutSectionWidget({super.key, required this.titleText, required this.itemText});

  Widget _title() => Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Text('$titleText:'));

  Widget _item() => LayoutBuilder(
      builder: (context, constraints) => Card(
          // color: AppColors.appPrimary,
          child: Container(
              width: constraints.maxWidth,
              padding: const EdgeInsets.all(10),
              child: Text(
                itemText,
                // style: TextStyle(color: AppColors.textNormalLight)
              ))));

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_title(), _item()]));
}
