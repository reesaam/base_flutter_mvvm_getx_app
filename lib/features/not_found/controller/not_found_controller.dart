import 'package:flutter/material.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_resources/icons.dart';
import '../../../core/core_resources/page_details.dart';

@GetPut.controller()
class NotFoundController extends CoreController {
  late Icon icon;

  @override
  void pageInit() {
    pageDetail = AppPages.notFound;
    icon = AppIcons.notFound;
  }
}
