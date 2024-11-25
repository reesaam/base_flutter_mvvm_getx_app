import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_regex/flutter_regex.dart';

import '../../../core/core_functions.dart';
import '../../core/app_localization.dart';
import '../../shared/shared_models/verifier_models/regex_model/regex_model.dart';
import '../../core/extensions/extensions_on_data_models/extension_regexes.dart';
import '../../core/extensions/extensions_on_data_types/extension_icon.dart';
import '../resources/elements.dart';
import '../resources/paddings.dart';
import '../resources/text_styles.dart';
import '../theme/theme_functions.dart';
import '../theme/themes.dart';
import 'text_field.dart';
import 'text_field_abstraction.dart';

/// General and Complete Widget for [AppTextField]
/// All TextField in the App will generate with this Widget in [AppTextField]
/// [AppTextField] also uses [AppTextFieldAbstraction] for Abstraction which has been explained

abstract class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    required this.controller,
    this.undoController,
    this.label,
    this.hint,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.textInputType,
    this.textInputAction,
    this.textDirection,
    this.isPassword,
    this.leadingIcon,
    this.leadingAction,
    this.prefixIcon,
    this.prefixAction,
    this.suffixIcon,
    this.suffixAction,
    this.wholeWidgetAction,
    this.onChangedAction,
    this.regexValidator,
    this.inputFormatters,
    this.editable,
    this.hasCounter,
    this.errorText,
    this.maxLines,
    this.maxLength,
    this.showMaxLength,
    this.expandable,
    this.autoFocus,
    this.focusNode,
  });

  final TextEditingController controller;
  final UndoHistoryController? undoController;
  final String? label;
  final String? hint;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final bool? isPassword;
  final Icon? leadingIcon;
  final Function()? leadingAction;
  final Icon? prefixIcon;
  final Function()? prefixAction;
  final Icon? suffixIcon;
  final Function()? suffixAction;
  final Function()? wholeWidgetAction;
  final Function(String)? onChangedAction;
  final AppRegexModel? regexValidator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? editable; // Default is false
  final bool? hasCounter; // Default is false
  final String? errorText; // Being null means it has no Error
  final int? maxLines; // Default is 1
  final int? maxLength; // Default is Infinite
  final bool? showMaxLength; // Default is false
  final bool? expandable; // Default is false
  final bool? autoFocus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    /// This detects DarkMode to change the Colors and Modes
    bool isDark = AppThemeFunctions.getMode();

    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      child: TextFormField(
          controller: controller,
          undoController: undoController,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          textDirection: textDirection,
          obscureText: isPassword ?? false,
          style: errorText == null ? AppTextStyles.textFieldText() : AppTextStyles.textError(),
          cursorColor: AppThemes.to.primaryColor,
          keyboardType: textInputType ?? TextInputType.text,
          textInputAction: textInputAction,

          /// if [expandable] it could not been set, and if [obscured] it must be 1
          /// And it can't set in parent function, it should be set in the widget itself
          maxLines: expandable == true
              ? null
              : isPassword == true
              ? 1
              : maxLines,
          maxLength: maxLength,
          expands: expandable == true,
          enableInteractiveSelection: editable == false || wholeWidgetAction != null ? false : true,
          autofocus: autoFocus ?? false,
          focusNode: focusNode,
          canRequestFocus: editable == false || wholeWidgetAction != null ? false : true,
          scrollPhysics: const BouncingScrollPhysics(),
          onTap: wholeWidgetAction == null ? () {} : () => wholeWidgetAction!(),
          onChanged: (value) => onChangedAction == null ? () {} : onChangedAction!(value),
          onTapOutside: (event) => FocusScope.of(context).previousFocus(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => _errorDetector(),
          inputFormatters: inputFormatters ?? _formatters(),
          buildCounter: (context, {required currentLength, required isFocused, required maxLength}) =>
          hasCounter == true || showMaxLength == true ? _buildCounter(currentLength) : null,

          /// All Decoration Customizations
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: double.maxFinite),
            contentPadding: AppPaddings.textFieldContent,
            labelText: label,
            labelStyle: errorText == null ? AppTextStyles.textFieldText() : AppTextStyles.textError(),
            hintText: hint,
            hintStyle: AppTextStyles.textFieldHint(),
            alignLabelWithHint: true,
            hintMaxLines: 1,
            icon: _leading,
            prefixIcon: _prefix,
            suffixIcon: _suffix,
            border: AppElements.borderOutlined,
            enabledBorder: _errorDetector() == null
                ? AppElements.borderOutlined
                : AppElements.borderOutlinedError,
            disabledBorder: AppElements.borderOutlinedDisabled,
            focusedBorder: AppElements.borderOutlinedFocused,
            isDense: true,
            isCollapsed: true,
            errorStyle: _errorDetector() == null ? null : AppTextStyles.textError(),
            errorBorder: _errorDetector() == null
                ? null
                : AppElements.borderOutlinedError,
            errorText: _errorDetector(),
          )),
    );
  }

  Widget? get _leading => leadingIcon == null
      ? null
      : InkWell(
    onTap: () => leadingAction == null ? nullFunction() : leadingAction!(),
    child: leadingIcon?.withSecondaryColor,
  );

  Widget? get _prefix => prefixIcon == null
      ? null
      : InkWell(
    onTap: () => prefixAction == null ? nullFunction() : prefixAction!(),
    child: prefixIcon?.withSecondaryColor,
  );

  Widget? get _suffix => suffixIcon == null
      ? null
      : InkWell(
    onTap: () => suffixAction == null ? nullFunction() : suffixAction!(),
    child: suffixIcon?.withSecondaryColor,
  );

  /// All Errors would Detect by this function
  /// Even multiple conditions will Check and shows by their priority
  String? _errorDetector() {
    String? text;

    //Regex Check
    if (regexValidator != null) _regexValidator(controller.text) ? text = null : text = errorText ?? Texts.to.incorrect;

    //In case of conditions to check and show error are absent ErrorText will come from above
    if (regexValidator == null) text == errorText;

    return text;
  }

  List<TextInputFormatter>? _formatters() {
    List<TextInputFormatter>? formatters = List<TextInputFormatter>.empty(growable: true);
    if (regexValidator != null && !AppRegexModelsList.exceptionsOfFormatting().contains(regexValidator!)) {
      formatters.add(FilteringTextInputFormatter.allow(regexValidator!.regExp));
    }

    return formatters.isEmpty ? null : formatters;
  }

  /// Regex Checker
  bool _regexValidator(String value) => value == Texts.to.empty ? true : RegexVal.hasMatch(value, regexValidator!.regexValue);

  /// Counter Builder
  /// [Counter], [MaxLength] and [CurrentLength] has Specific and Complicated Conditions
  /// Counter with [ShowMaxLength == False] and [maxLength != null] will show Counter but without showing its limitation but it has the limitation
  /// Counter with [MaxLength == null] would just unlimited counts the Chars
  Widget _buildCounter(int currentLength) {
    String text = '';
    if (hasCounter == true) {
      text = '${currentLength.toString()}${maxLength == null ? Texts.to.empty : ' / ${maxLength.toString()}'}';
    } else if (showMaxLength == true) {
      text = currentLength.toString();
    }
    return Text(text);
  }
}
