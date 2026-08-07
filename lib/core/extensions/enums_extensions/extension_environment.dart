import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';

extension ExtensionCountriesList on Environment {
  String get getEnvName => this.name.capitalizeFirst ?? Texts.to.general.empty;
}
