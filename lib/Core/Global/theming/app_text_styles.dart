import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/core/Global/app_strings.dart';
import 'package:turn_digital/core/Global/theming/color_manager.dart';

import '../Helpers/font_weight_helper.dart';

class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  static final font24BlackWeight600 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppStrings.appFontFamily,
    color: Colors.black,
  );

  static final font14GreyWeight400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppStrings.appFontFamily,
    color: Color(0xFF747688),
  );

  static final font16WhiteWeight400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppStrings.appFontFamily,
    color: Colors.white,
  );

  static final font16GreyWeight500 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppStrings.appFontFamily,
    color: Color(0xFF9D9898),
  );

  static final font15BlackWeight400 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppStrings.appFontFamily,
    color: Colors.black,
  );

  static final font12WhiteWeight400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: AppStrings.appFontFamily,
    color: Colors.white,
  );

  static final font13WhiteWeight500 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppStrings.appFontFamily,
    color: Colors.white,
  );

  static final font18BlackWeight500 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: AppStrings.appFontFamily,
    color: Colors.black,
  );

  TextStyle generateNewTextStyle({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight ?? FontWeightHelper.regular,
      color: color ?? AppColorsManager.textColor,
    );
  }
}
