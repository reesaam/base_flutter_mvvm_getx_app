import '../barrels/extensions_barrel.dart';
import '../barrels/localization_barrel.dart';
import '../barrels/ui_kit_barrel.dart';

class AdminFunctions {
  static section(List<Widget> section, {bool? isRow, String? title, Color? backgroundColor}) => Column(
    children: [
      if (title != null)
        Column(
          children: [
            AppDividers.general(),
            Text(title, style: const TextStyle(fontSize: 20)),
            AppDividers.general(),
          ],
        ),
      AppContainer(
        padding: AppPaddings.buttonXLarge,
        child: isRow == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List<Widget>.generate(section.length, (index) => AppBox.expanded(child: section[index])),
              )
            : Column(children: section),
      ),
      AppDividers.generalWithDisabledColor,
    ],
  );

  static Widget item({String? title, String? text, Widget? widget, List<Widget>? multipleItems, bool? primary, bool? fullWidth}) => Column(
    children: [
      Padding(
        padding: fullWidth == true ? AppPaddings.zero : AppPaddings.buttonXLarge,
        child: text == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null) Text(title, textAlign: TextAlign.center),
                  if (title != null) AppSpaces.h20,
                  AppContainer(
                    padding: fullWidth == true ? AppPaddings.zero : const EdgeInsets.symmetric(horizontal: 20),
                    child: multipleItems == null
                        ? widget ?? AppBox.shrink()
                        : Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: multipleItems),
                  ),
                ],
              )
            : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title?.withDoubleDots ?? Texts.to.general.empty), Text(text)]),
      ),
    ],
  );

  static sectionGrid({required List<Widget> items, required String title}) {
    return Column(
      children: [
        AppDividers.general(),
        Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 20)),
            AppDividers.settings,
          ],
        ),
        AppDividers.general(),
        Padding(
          padding: AppPaddings.buttonXLarge,
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: items.length > 1 ? 4 : 8,
            crossAxisCount: items.length > 1 ? 2 : 1,
            children: List<Widget>.generate(items.length, (index) => items[index]),
          ),
        ),
        AppDividers.generalWithDisabledColor,
      ],
    );
  }

  static itemButton({required String text, required Function function}) => AppButton.general(text: text, onTap: () => function());
}
