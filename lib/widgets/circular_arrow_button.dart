import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/core/constants/app_colors.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';

class CircularArrowButton extends StatelessWidget {
  const CircularArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.arrowButtonSize.w,
      height: AppSizes.arrowButtonSize.w,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: AppSizes.opacityCircle),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.lightCream,
        size: AppSizes.iconSizeMd.w,
      ),
    );
  }
}
