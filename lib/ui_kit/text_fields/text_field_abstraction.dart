import 'text_field.dart';
import 'text_field_widget.dart';

/// Abstraction for TextField to Determine what functions TextFields have without checking the main file.
/// [AppTextFieldWidget] is the Main Widget which creates a general complete Widget of a TextField with all the parameters
/// [AppTextField] extends [AppTextFieldWidget] and use [AppTextFieldAbstraction] Abstraction for two purposes
/// first, for Developer's knowledge of existing factories of the TextFields and what Options do they have
/// and second, is for developing purposes, means if existing AppTextField was not enough or complete to Answer Developing needs
/// it can be extended and developed by another widget or any other way of implementation

abstract class AppTextFieldAbstraction {
  AppTextFieldAbstraction.general();
  AppTextFieldAbstraction.password();
  AppTextFieldAbstraction.phone();
  AppTextFieldAbstraction.email();
  AppTextFieldAbstraction.numeric();
}