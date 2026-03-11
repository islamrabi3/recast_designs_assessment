import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:recast_designs_assessment/core/app_theme/app_theme.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/features/home/home_bindings.dart';
import 'package:recast_designs_assessment/features/home/home_page.dart';
import 'package:recast_designs_assessment/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          getPages: getPages,
          initialBinding: HomeBindings(),
          theme: AppTheme.darkTheme,
          home: HomePage(),
        );
      },
    );
  }
}
