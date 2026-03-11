import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recast_designs_assessment/core/app_theme/app_theme.dart';
import 'package:recast_designs_assessment/features/home/home_bindings.dart';
import 'package:recast_designs_assessment/features/profile/profile_bindings.dart';

/// Wraps a widget for testing with ScreenUtil and theme.
Widget pumpTestWidget(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, _) => MaterialApp(
      theme: AppTheme.darkTheme,
      home: child,
    ),
  );
}

/// Wraps a widget for GetX-dependent widgets (needs HomeController).
Widget pumpTestWidgetWithGet(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, _) => GetMaterialApp(
      theme: AppTheme.darkTheme,
      initialBinding: HomeBindings(),
      home: child,
    ),
  );
}

/// Wraps a widget for GetX-dependent widgets (needs ProfileController).
Widget pumpTestWidgetWithProfileGet(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, _) => GetMaterialApp(
      theme: AppTheme.darkTheme,
      initialBinding: ProfileBindings(),
      home: Scaffold(
        body: child,
      ),
    ),
  );
}
