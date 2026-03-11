import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/core/constants/app_colors.dart';
import 'package:recast_designs_assessment/core/constants/app_fonts.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/models/loyalty_history_item.dart';
import 'package:recast_designs_assessment/widgets/loyal_history_image.dart';

class LoyaltyHistoryCard extends StatelessWidget {
  final LoyaltyHistoryItem item;
  final VoidCallback? onTap;

  const LoyaltyHistoryCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSizes.spacingLarge.h),
        padding: EdgeInsets.all(AppSizes.spacingLarge.w),
        decoration: BoxDecoration(
          color: AppColors.mediumGrey30,
          borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
        ),
        child: Row(
          children: [
            LoyalHistoryImage(item: item),
            SizedBox(width: AppSizes.spacingLarge.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.restaurantName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.satoshi,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacingSmall.h),
                  Text(item.date, style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: AppSizes.spacingSmall.h),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [AppColors.sandGold, AppColors.lightCream],
                    ).createShader(bounds),
                    child: Text(
                      '${item.amount} • ${item.creditsEarned} ${AppStrings.credits}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w200,
                        fontSize: AppSizes.fontSizeMd.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingSmall.w,
                    vertical: AppSizes.paddingTiny.h,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.sandGold, AppColors.lightCream],
                    ),
                    borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                  ),
                  child: Text(
                    '${item.totalCredits} ${AppStrings.credits}',
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeSm.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: AppSizes.letterSpacingTight,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.spacingMedium.h),
                Icon(
                  Icons.arrow_forward_ios,
                  size: AppSizes.iconSizeSm.w,
                  color: Colors.white.withValues(alpha: AppSizes.opacityLight),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
