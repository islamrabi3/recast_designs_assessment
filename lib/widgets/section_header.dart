import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: AppSizes.fontSizeBase.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: AppSizes.letterSpacingWide,
        color: Colors.white.withValues(alpha: AppSizes.opacityStrong),
      ),
    );
  }
}
