import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

import '../controller/admin_app_countries_controller.dart';

@GetPut.page()
class AdminAppCountriesPage extends CoreView<AdminAppCountriesController> {
  const AdminAppCountriesPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(
    children: [
      AppDividers.generalWithDisabledColor,
      Column(children: List<Widget>.generate(controller.countries.length, (index) => _section(controller.countries[index]))),
    ],
  );

  _section(AppCountry country) => Column(
    children: [
      Padding(
        padding: AppPaddings.buttonXLarge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBox.expanded(
              flex: 5,
              child: Column(
                children: [
                  _item('Name Abbr', country.countryNameAbbreviation),
                  _item('TimeZone Abbr', country.timeZoneAbbreviation?.getMiddleElement<String>()),
                  _item('TimeZone Offset', country.timeZoneOffset?.getMiddleElement<DurationCustomModel>().toDuration().toTimeZoneFormat()),
                  _item('Code', country.code),
                  _item('Currency', country.currency?.name),
                  _item('Currency Sign', country.currency?.sign.string),
                ],
              ),
            ),
            AppBox.shrinkExpanded(flex: 2),
            AppBox.expanded(
              flex: 2,
              child: Column(children: [country.flag(rounded: true, hasBorder: true), AppSpaces.h20, Text(country.countryName ?? '')]),
            ),
          ],
        ),
      ),
      AppDividers.generalWithDisabledColor,
    ],
  );

  _item(String? title, String? text) => text == null
      ? AppBox.shrink()
      : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title?.withDoubleDots ?? ''), Text(text)]);
}
