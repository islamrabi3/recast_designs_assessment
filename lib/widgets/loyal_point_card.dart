import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:recast_designs_assessment/core/constants/app_assets.dart';
import 'package:recast_designs_assessment/core/constants/app_colors.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/models/loyalty_summary.dart';

class LoyalPointWidget extends StatelessWidget {
  final LoyaltySummary summary;
  final VoidCallback? onMoreDetailsTap;

  const LoyalPointWidget({
    super.key,
    required this.summary,
    this.onMoreDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.22,
      decoration: BoxDecoration(
        color: AppColors.mediumGrey30,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal.r,
          vertical: AppSizes.paddingVertical.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      summary.brandName,
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeXs.sp,
                        letterSpacing: AppSizes.letterSpacingNormal,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      summary.loyaltyTitle,
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeBase.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: AppSizes.letterSpacingWide,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  AppAssets.userPlaceholder,
                  width: AppSizes.loyaltyIconSize.w,
                  height: AppSizes.loyaltyIconSize.w,
                ),
              ],
            ),
            SizedBox(height: AppSizes.spacingMedium.h),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.sandGold, AppColors.lightCream],
              ).createShader(bounds),
              child: Text(
                NumberFormat('#,###').format(summary.points),
                style: TextStyle(
                  fontSize: AppSizes.fontSize2xl.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: AppSizes.letterSpacingWider,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: AppSizes.paddingTiny.h),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
              minHeight: AppSizes.progressBarHeight.sp,
              value: summary.progressValue,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.sandGold,
              ),
              backgroundColor: Colors.black,
            ),
            SizedBox(height: AppSizes.spacingMedium.h),
            Row(
              children: [
                Text(
                  AppStrings.totalOrders,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeSm.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: AppSizes.letterSpacingWide,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(width: AppSizes.spacingSmall.w),
                Text(
                  '${summary.totalOrders}',
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeSm.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: AppSizes.letterSpacingWide,
                    color: AppColors.lightCream,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.spacingTiny.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: AppSizes.spacingSmall.w,
                  children: summary.rewardImagePaths
                      .map(
                        (path) => Image.asset(
                          path,
                          width: AppSizes.rewardImageSize.w,
                          height: AppSizes.rewardImageSize.w,
                        ),
                      )
                      .toList(),
                ),
                GestureDetector(
                  onTap: onMoreDetailsTap,
                  child: Container(
                    height: AppSizes.moreDetailsButtonHeight.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingSmall.w,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(AppSizes.radiusPill),
                    ),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.moreDetails,
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeXs.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: AppSizes.letterSpacingTight,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: AppSizes.spacingSmall.w),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white60,
                          size: AppSizes.iconSizeXs.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
