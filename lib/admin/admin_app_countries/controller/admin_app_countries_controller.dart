import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

@GetPut.controller()
class AdminAppCountriesController extends CoreController {
  List<AppCountry> countries = AppCountry.values.getSortedCountriesList;

  @override
  AppPageDetail get pageDetail => AppPages.adminAppCountriesPage;
}
