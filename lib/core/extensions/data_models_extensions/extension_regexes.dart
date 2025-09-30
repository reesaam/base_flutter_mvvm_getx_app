
import '../../../shared/shared_models/verifier_models/regex_model/regex_model.dart';

extension Equal on AppRegexModel {
  bool equalTo(AppRegexModel regExp) => regexValue == regExp.regexValue;
}

extension GetRegExp on AppRegexModel {
  RegExp get regExp => RegExp(regexValue);
}

extension ListContains on List<AppRegexModel> {
  bool contains(AppRegexModel regExp) => where((element) => element.equalTo(regExp)).isNotEmpty;
}

extension ListModelContains on AppRegexModelsList {
  bool contains(AppRegexModel regExp) => regexesList.where((element) => element.equalTo(regExp)).isNotEmpty ?? false;
}