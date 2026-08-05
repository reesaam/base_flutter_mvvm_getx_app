import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/extensions_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

import '../../admin_general_functions.dart';
import '../controller/admin_app_info_controller.dart';

@GetPut.page()
class AdminAppInfoPage extends CoreView<AdminAppInfoController> {
  const AdminAppInfoPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [
        AppDividers.generalWithDisabledColor,
        _appInfo(),
        _appDeveloperInfo(),
        _appStatisticsInfo(),
        _locale(),
        _localization(),
      ]);

  _appInfo() => AdminFunctions.section([
        AdminFunctions.item(title: 'App Name', text: AppInfo.appName),
        AdminFunctions.item(title: 'App Name Initials', text: AppInfo.appNameInitials),
        AdminFunctions.item(title: 'Website', text: AppInfo.website),
        AdminFunctions.item(title: 'Current Version', text: AppInfo.currentVersion.version),
        // AdminFunctions.item(title: 'Version Counter', text: AppInfo.versionsCounter.toString()),
        AdminFunctions.item(title: 'Base URL', text: AppInfo.baseUrl),
        AdminFunctions.item(title: 'SubDomain', text: AppInfo.subDomain),
        AdminFunctions.item(title: 'Is Release', text: CoreFlags.isRelease.toString()),
        AdminFunctions.item(title: 'Check Update', text: CoreFlags.checkUpdate.toString()),
      ], title: 'App Info');

  _appDeveloperInfo() => AdminFunctions.section([
        AdminFunctions.item(title: 'Full Name', text: AppDeveloperInfo.fullName),
        AdminFunctions.item(title: 'Website', text: AppDeveloperInfo.website),
        AdminFunctions.item(title: 'LinkedIn', text: AppDeveloperInfo.linkedin),
      ], title: 'App Developer Info');

  _appStatisticsInfo() => AdminFunctions.section([
        AdminFunctions.item(title: 'Launches', text: controller.statisticsData.value.launches.toString()),
        AdminFunctions.item(title: 'Logins', text: controller.statisticsData.value.logins.toString()),
        AdminFunctions.item(title: 'Crashes', text: controller.statisticsData.value.crashes.toString()),
        AdminFunctions.item(title: 'Install DateTime', text: controller.statisticsData.value.installDateTime?.toDateTimeFormat()),
        AdminFunctions.item(title: 'Install Duration', text: controller.statisticsData.value.installDuration?.toConditionalFormat()),
        AdminFunctions.item(title: 'Page Opens', text: controller.statisticsData.value.pageOpens.toString()),
        AdminFunctions.item(title: 'Api Calls', text: controller.statisticsData.value.apiCalls.toString()),
      ], title: 'App Statistics Info');

  _locale() => AdminFunctions.section([
        AdminFunctions.item(title: 'Locale', text: AppLocalizations.to.translation?.getLanguage?.locale.toLanguageTag()),
        AdminFunctions.item(title: 'Language Code', text: AppLocalizations.to.translation?.getLanguage?.locale.languageCode),
        AdminFunctions.item(title: 'Language Name', text: AppLocalizations.to.translation?.getLanguage?.languageName),
        AdminFunctions.item(title: 'Text Direction', text: AppLocalizations.to.translation?.getLanguage?.textDirection.name),
      ], title: 'Locale');

  _localization() {
    AppCountry country = AppLocalizations.to.getCountry();
    return AdminFunctions.section([
      AdminFunctions.item(title: 'Country Name', text: country.countryName),
      AdminFunctions.item(title: 'Country Name Abbreviation', text: country.countryNameAbbreviation),
      AdminFunctions.item(title: 'Country Code', text: country.code ?? Texts.to.general.notAvailableInitials),
      AdminFunctions.item(title: 'TimeZone Abbreviation', text: country.timeZoneAbbreviation?.getMiddleElement<String>()),
      AdminFunctions.item(title: 'TimeZone Offset', text: country.timeZoneOffset?.getMiddleElement<DurationCustomModel>().toFormattedOffset()),
      AdminFunctions.item(title: 'Currency Sign', text: country.currency?.sign.string),
    ], title: 'Localization');
  }
}
