import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:recast_designs_assessment/core/constants/app_colors.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/features/profile/profile_controller.dart';

class ProfileInfoSection extends GetView<ProfileController> {
  final VoidCallback onEditTap;

  const ProfileInfoSection({super.key, required this.onEditTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
          child: Image.asset(
            controller.user.profileImagePath,
            width: AppSizes.profileImageSize.sp,
            height: AppSizes.profileImageSize.sp,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: AppSizes.spacingXLarge.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.user.name,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeXl.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: AppSizes.letterSpacingWide,
                  color: Colors.white,
                ),
              ),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.sandGold, AppColors.lightCream],
                ).createShader(bounds),
                child: Text(
                  controller.user.phoneNumber,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onEditTap,
          child: Text(
            AppStrings.edit,
            style: TextStyle(
              fontSize: AppSizes.fontSizeLg.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: AppSizes.letterSpacingNormal,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
