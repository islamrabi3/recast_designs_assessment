import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/core/constants/app_colors.dart';
import 'package:recast_designs_assessment/core/constants/app_fonts.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: AppSizes.fontSizeBase.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: AppSizes.letterSpacingWide,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: AppSizes.fontSizeSm.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: AppSizes.letterSpacingWide,
        color: Colors.white,
        fontFamily: AppFonts.satoshi,
      ),
      bodyLarge: TextStyle(
        fontSize: AppSizes.fontSizeXl.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: AppSizes.letterSpacingWide,
        color: Colors.white,
      ),
    ),
    useMaterial3: true,
    fontFamily: AppFonts.satoshiVariable,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,

      titleTextStyle: TextStyle(
        fontSize: AppSizes.fontSizeXl.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: AppSizes.letterSpacingWide,
        color: Colors.white.withAlpha(AppSizes.alphaAppBarTitle),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.sandGold),
  );
}
