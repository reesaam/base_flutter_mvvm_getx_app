import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/app_localization.dart';
import '../../../core/core_elements/core_controller.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../core/core_resources/page_details.dart';

@GetPut.controller()
class AdminVerifiersController extends CoreController {

  @override
  AppPageDetail get pageDetail => AppPageDetails.adminVerifiersPage;

  TextEditingController generalController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numericController = TextEditingController();

  Rx<String> general = Texts.to.empty.obs;
  Rx<String> password = Texts.to.empty.obs;
  Rx<String> phone = Texts.to.empty.obs;
  Rx<String> email = Texts.to.empty.obs;
  Rx<String> numeric = Texts.to.empty.obs;
}
