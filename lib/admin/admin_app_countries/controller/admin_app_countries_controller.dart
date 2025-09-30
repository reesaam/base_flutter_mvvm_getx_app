import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_resources/countries.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../core/extensions/enums_extensions/extension_countries.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';

@GetPut.controller()
class AdminAppCountriesController extends CoreController {
  List<AppCountry> countries = AppCountry.values.getSortedCountriesList;

  @override
  AppPageDetail get pageDetail => AppPageDetails.adminAppCountriesPage;
}
