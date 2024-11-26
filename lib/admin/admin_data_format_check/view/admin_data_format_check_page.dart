import 'package:flutter/material.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/app_localization.dart';
import '../../../core/core_elements/core_view.dart';
import '../../../core/core_resources/countries.dart';
import '../../../core/extensions/extensions_on_data_types/extension_date_time.dart';
import '../../../core/extensions/extensions_on_data_types/extension_int.dart';
import '../../../core/extensions/extensions_on_data_types/extension_locale.dart';
import '../../../ui_kit/general_widgets/dividers.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../../admin_general_functions.dart';
import '../controller/admin_data_format_check_controller.dart';

@GetPut.page()
class AdminDataFormatCheckPage extends CoreView<AdminDataFormatCheckController> {
  const AdminDataFormatCheckPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppDividers.generalWithDisabledColor,
        _locale(),
        _dateTime(),
        _currency(),
      ]);

  _locale() => AdminFunctions.section([
        AdminFunctions.item(title: 'Language', text: AppLocalization.to.getLocale().getLanguageName),
      ], title: 'Localization');

  _dateTime() => AdminFunctions.section([
        AdminFunctions.item(title: 'Date & Time', text: DateTime.now().toDateTimeFormat()),
        AdminFunctions.item(title: 'Date', text: DateTime.now().toDateFormat()),
        AdminFunctions.item(title: 'Time', text: DateTime.now().toTimeFormat()),
        AdminFunctions.item(title: 'Time with Seconds', text: DateTime.now().toTimeFormat(withSeconds: true)),
      ], title: 'Date & Time');

  _currency() => AdminFunctions.section([
        AdminFunctions.item(title: 'Separators', text: 22500000.toCurrency()),
        AdminFunctions.item(title: 'Separators with Sign', text: 55400000.toCurrency(sign: AppCountry.us.currency?.sign.string ?? '')),
        AdminFunctions.item(title: 'Separators', text: 22500000.toCurrency()),
        AdminFunctions.item(
            title: 'Separators with Sign',
            text: 55400000.toCurrency(sign: AppLocalization.to.getCountry().currency?.sign.string ?? AppCountry.us.currency?.sign.string ?? '')),
      ], title: 'Currency');
}
