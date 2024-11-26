import 'package:flutter/material.dart';

import '../../core/core_resources/defaults.dart';
import '../theme/themes.dart';
import '../theme/themes_variables.dart';

class AppElements {
  ///Radius
  static double get radiusZero => 0;
  static double get radiusLow => 10;
  static double get radiusNormal => 20;
  static double get radiusHigh => 30;
  static double get defaultRadius => radiusLow;

  ///BorderRadius
  static Radius get circularRadiusDefault => Radius.circular(defaultRadius);
  static Radius get circularRadiusZero => Radius.circular(radiusZero);
  static Radius get circularRadiusLow => Radius.circular(radiusLow);
  static Radius get circularRadiusNormal => Radius.circular(radiusNormal);
  static Radius get circularRadiusHigh => Radius.circular(radiusHigh);

  ///Border
  static BorderRadius get borderRadiusDefault => BorderRadius.all(circularRadiusDefault);
  static BorderRadius get borderRadiusZero => BorderRadius.all(circularRadiusZero);
  static BorderRadius get borderRadiusLow => BorderRadius.all(circularRadiusLow);
  static BorderRadius get borderRadiusNormal => BorderRadius.all(circularRadiusNormal);
  static BorderRadius get borderRadiusHigh => BorderRadius.all(circularRadiusHigh);

  static BorderRadius get borderRadiusTop => BorderRadius.only(topLeft: circularRadiusDefault, topRight: circularRadiusDefault);

  ///BorderSide
  static BorderSide get _borderSideGeneral => BorderSide(color: AppThemes.to.colorScheme.secondary, width: appDefaultBorderWidth);
  static BorderSide get borderSide => _borderSideGeneral.copyWith(color: AppThemes.to.primaryColor);
  static BorderSide get borderSidePrimary => _borderSideGeneral.copyWith(color: AppThemes.to.primaryColor);
  static BorderSide get borderSideSecondary => _borderSideGeneral.copyWith(color: AppThemes.to.colorScheme.secondary);
  static BorderSide get borderSideTertiary => _borderSideGeneral.copyWith(color: AppThemes.to.colorScheme.tertiary);
  static BorderSide get borderSideError => _borderSideGeneral.copyWith(color: AppThemes.to.colorScheme.error);
  static BorderSide get borderSideTransparent => _borderSideGeneral.copyWith(color: AppThemesVariables.transparent);
  static BorderSide get borderSideFocused => _borderSideGeneral.copyWith(color: AppThemes.to.colorScheme.secondary);
  static BorderSide get borderSideDisabled => _borderSideGeneral.copyWith(color: AppThemesVariables.transparent);

  ///OutlineInputBorder
  static OutlineInputBorder get _borderOutlinedGeneral => OutlineInputBorder(borderRadius: borderRadiusLow);
  static OutlineInputBorder get borderOutlined => _borderOutlinedGeneral.copyWith(borderSide: borderSide);
  static OutlineInputBorder get borderOutlinedFocused => _borderOutlinedGeneral.copyWith(borderSide: borderSideFocused);
  static OutlineInputBorder get borderOutlinedDisabled => _borderOutlinedGeneral.copyWith(borderSide: borderSideDisabled);
  static OutlineInputBorder get borderOutlinedError => _borderOutlinedGeneral.copyWith(borderSide: borderSideError);
  static OutlineInputBorder get borderOutlinedTransparent => _borderOutlinedGeneral.copyWith(borderSide: borderSideTransparent);
  static OutlineInputBorder get borderOutlinedTransparentZeroRadius => borderOutlinedTransparent.copyWith(borderRadius: borderRadiusZero);

  ///BoxBorder
  static BoxBorder get boxBorder => Border.all(color: AppThemes.to.canvasColor);
  static BoxBorder get boxBorderTransparent => Border.all(color: AppThemesVariables.transparent);

  ///Shapes
  static BoxDecoration get boxDecorationDefault => BoxDecoration(borderRadius: AppElements.borderRadiusDefault);
  static BoxDecoration get listPageSearchBox => BoxDecoration(border: Border.all(color: AppThemesVariables.transparent));

  ///RoundedRectangleBorder
  static RoundedRectangleBorder get borderShapeDefault => borderShapeLowRadius;
  static RoundedRectangleBorder get borderShapeLowRadius => RoundedRectangleBorder(borderRadius: borderRadiusLow);
  static RoundedRectangleBorder get borderShapeNormalRadius => RoundedRectangleBorder(borderRadius: borderRadiusLow, side: borderSidePrimary);
  static RoundedRectangleBorder get borderShapeHighRadius => RoundedRectangleBorder(borderRadius: borderRadiusLow);
  static RoundedRectangleBorder get borderShapeModal => RoundedRectangleBorder(borderRadius: borderRadiusTop);
  static RoundedRectangleBorder get borderShapeAlertDialog => RoundedRectangleBorder(borderRadius: borderRadiusDefault);

  ///Avatars
  static double get contactsListAvatarMaxRadius => 18;
  static double get contactsContactAvatarMaxRadius => 30;

///Panel
// static BoxBorder get defaultPanelBorder => Border.all(color: AppThemes.to.panelBorder);
// static BoxDecoration get defaultPanel => BoxDecoration(border: defaultPanelBorder, borderRadius: defaultBorderWithRadius);
}
