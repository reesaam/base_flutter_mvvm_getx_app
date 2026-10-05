import '../../../barrels/core_resources_barrel.dart';

extension ExtensionsOnAppRegexes on AppRegexes {
  bool equalTo(AppRegexes regExp) => value() == regExp.value();

  RegExp get regExp => RegExp(value());

  bool contains(AppRegexes regExp) => AppRegexes.values.where((element) => element.equalTo(regExp)).isNotEmpty;
}
