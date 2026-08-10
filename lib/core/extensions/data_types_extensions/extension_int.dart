import 'package:intl/intl.dart';

import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

extension ExtensionIconFunction on int? {
  Icon toIcon() => this == null ? AppIcons.none.widget : Icon(IconData(this!, fontFamily: AppFonts.materialIcons));
}

extension ExtensionCurrencyFormat on int {
  String toCurrency({String? sign, int? decimalDigits}) => NumberFormat.currency(symbol: sign ?? '', decimalDigits: decimalDigits ?? 0).format(this);
}

extension ExtensionCurrencyFormatNull on int? {
  String toCurrency({String? sign}) => this == null ? Texts.to.general.notAvailableInitials : this!.toCurrency();
}
