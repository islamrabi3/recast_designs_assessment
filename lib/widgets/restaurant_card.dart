import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/core/constants/app_colors.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/models/restaurant.dart';
import 'package:recast_designs_assessment/widgets/circular_arrow_button.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final double height;
  final VoidCallback? onTap;

  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radiusXXL),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: AppSizes.opacityShadow),
              blurRadius: AppSizes.shadowBlur,
              offset: Offset(0, AppSizes.shadowOffset),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radiusXXL),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(restaurant.imagePath, fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: AppSizes.opacityOverlay),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: AppSizes.spacingLarge.w,
                right: AppSizes.spacingXXLarge * 2.w,
                bottom: AppSizes.spacingLarge.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      restaurant.category,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: AppSizes.spacingSmall.h),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [AppColors.sandGold, AppColors.lightCream],
                      ).createShader(bounds),
                      child: Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: AppSizes.spacingLarge.w,
                bottom: AppSizes.spacingLarge.h,
                child: CircularArrowButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
