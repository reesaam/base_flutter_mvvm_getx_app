import 'package:intl/intl.dart';

import '../../../localization/localizations.dart';
import '../../core_resources/fonts.dart';
import '../../core_resources/icons.dart';

extension ExtensionIconFunction on int? {
  Icon toIcon() => this == null ? AppIcons.none.widget : Icon(IconData(this!, fontFamily: AppFonts.materialIcons));
}

extension ExtensionCurrencyFormat on int {
  String toCurrency({String? sign, int? decimalDigits}) =>
      NumberFormat.currency(symbol: sign ?? '', decimalDigits: decimalDigits ?? 0).format(this);
}

extension ExtensionCurrencyFormatNull on int? {
  String toCurrency({String? sign}) => this == null ? Texts.to.general.notAvailableInitials : this!.toCurrency();
}
