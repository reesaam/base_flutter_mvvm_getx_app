import 'package:flutter/material.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_elements/core_view.dart';
import '../../../shared/shared_models/helper_models/duration_custom_model/duration_custom_model.dart';
import '../../../core/extensions/extensions_on_data_types/extension_custom_duration.dart';
import '../../../core/extensions/extensions_on_data_types/extension_duration.dart';
import '../../../core/extensions/extensions_on_data_types/extension_list.dart';
import '../../../core/extensions/extensions_on_data_types/extension_string.dart';
import '../../../core/extensions/extensions_on_enums/extension_on_countries.dart';
import '../../../ui_kit/core_widgets.dart';
import '../../../core/core_resources/countries.dart';
import '../../../ui_kit/general_widgets/dividers.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../../../ui_kit/resources/spaces.dart';
import '../controller/admin_app_countries_controller.dart';

@GetPut.page()
class AdminAppCountriesPage extends CoreView<AdminAppCountriesController> {
  const AdminAppCountriesPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [
        AppDividers.generalWithDisabledColor,
        Column(
            children: List<Widget>.generate(
          controller.countries.length,
          (index) => _section(controller.countries[index]),
        ))
      ]);

  _section(AppCountry country) => Column(children: [
        Padding(
            padding: AppPaddings.buttonXLarge,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  flex: 5,
                  child: Column(children: [
                    _item('Name Abbr', country.countryNameAbbreviation),
                    _item('TimeZone Abbr', country.timeZoneAbbreviation?.getMiddleElement<String>()),
                    _item('TimeZone Offset', country.timeZoneOffset?.getMiddleElement<DurationCustomModel>().toDuration().toTimeZoneFormat()),
                    _item('Code', country.code),
                    _item('Currency', country.currency?.name),
                    _item('Currency Sign', country.currency?.sign.string),
                  ])),
              shrinkExpanded(2),
              Expanded(
                  flex: 2,
                  child: Column(children: [
                    country.flag(rounded: true, hasBorder: true),
                    AppSpaces.h20,
                    Text(country.countryName ?? ''),
                  ])),
            ])),
        AppDividers.generalWithDisabledColor,
      ]);

  _item(String? title, String? text) => text == null
      ? shrinkSizedBox
      : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title?.withDoubleDots ?? ''),
          Text(text),
        ]);
}
