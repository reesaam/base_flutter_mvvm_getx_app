import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';
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
  Widget get body => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [AppDividers.generalWithDisabledColor, _locale(), _dateTime(), _currency()],
  );

  _locale() => AdminFunctions.section([
    AdminFunctions.item(title: 'Language', text: AppLocalizations.to.translation?.getLanguage?.languageName),
  ], title: 'Localization');

  _dateTime() => AdminFunctions.section([
    AdminFunctions.item(title: 'Date & Time', text: DateTime.now().toDateTimeFormat()),
    AdminFunctions.item(title: 'Date', text: DateTime.now().toDateFormat()),
    AdminFunctions.item(title: 'Time', text: DateTime.now().toTimeFormat()),
    AdminFunctions.item(title: 'Time with Seconds', text: DateTime.now().toTimeFormat(withSeconds: true)),
  ], title: 'Date & Time');

  _currency() => AdminFunctions.section([
    AdminFunctions.item(title: 'Separators', text: 22500000.toCurrency()),
    AdminFunctions.item(
      title: 'Separators with Sign',
      text: 55400000.toCurrency(sign: AppCountry.us.currency?.sign.string ?? ''),
    ),
    AdminFunctions.item(title: 'Separators', text: 22500000.toCurrency()),
    AdminFunctions.item(
      title: 'Separators with Sign',
      text: 55400000.toCurrency(sign: AppLocalizations.to.getCountry().currency?.sign.string ?? AppCountry.us.currency?.sign.string ?? ''),
    ),
  ], title: 'Currency');
}
