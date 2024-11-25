import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_elements/core_view.dart';
import '../../../ui_kit/text_fields/text_field.dart';
import '../../../ui_kit/general_widgets/dividers.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../../admin_general_functions.dart';
import '../controller/admin_verifiers_controller.dart';

@GetPut.page()
class AdminVerifiersPage extends CoreView<AdminVerifiersController> {
  const AdminVerifiersPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppDividers.generalWithDisabledColor,
        _textFields(),
      ]);

  _textFields() => Obx(() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'General',
            widget: AppTextField.general(
              hint: 'Text',
              label: controller.general.value,
              controller: controller.generalController,
            )),
    AdminFunctions.item(
        title: 'Password',
        widget: AppTextField.password(
          hint: 'Password',
          label: controller.password.value,
          controller: controller.passwordController,
        )),
        AdminFunctions.item(
            title: 'Phone',
            widget: AppTextField.phone(
              hint: '0987654321',
              label: controller.phone.value,
              controller: controller.phoneController,
            )),
        AdminFunctions.item(
            title: 'Email',
            widget: AppTextField.email(
              hint: 'r@r.R',
              label: controller.email.value,
              controller: controller.emailController,
            )),
        AdminFunctions.item(
            title: 'Numeric',
            widget: AppTextField.numeric(
              hint: '123456',
              label: controller.numeric.value,
              controller: controller.numericController,
            )),
      ], title: 'Verifiers'));
}
