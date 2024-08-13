import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static const String fontFamily = 'Inter';
  static const String fontUnbounded = 'Unbounded';
  static const String ff = 'Inter';
  static const String fu = 'Unbounded';

  static TextStyle textStyle = const TextStyle(
      fontFamily: fontFamily,
      fontStyle: FontStyle.normal,
      color: AppColors.black);


}