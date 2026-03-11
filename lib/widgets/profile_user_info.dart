import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/core/constants/app_fonts.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/features/profile/profile_controller.dart';
import 'package:recast_designs_assessment/widgets/profile_section_info.dart';

class ProfileSliverUserInfo extends StatelessWidget {
  const ProfileSliverUserInfo({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.spacingXXLarge.h),
            ProfileInfoSection(onEditTap: controller.onEditTap),
            SizedBox(height: AppSizes.spacingXXXLarge.h),
            Text(
              AppStrings.loyaltyHistory,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontFamily: AppFonts.satoshi,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: AppSizes.spacingXLarge.h),
          ],
        ),
      ),
    );
  }
}
