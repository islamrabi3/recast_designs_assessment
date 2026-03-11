import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/widgets/loyal_point_card.dart';
import 'package:recast_designs_assessment/widgets/restaurant_card.dart';
import 'package:recast_designs_assessment/widgets/section_header.dart';
import 'package:recast_designs_assessment/widgets/welcome_widget.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeAndProfileWidget(),
                SizedBox(height: AppSizes.spacingXLarge.h),
                // Loyalty Points Section
                LoyalPointWidget(
                  summary: controller.loyaltySummary,
                  onMoreDetailsTap: controller.onMoreDetailsTap,
                ),
                SizedBox(height: AppSizes.spacingXLarge.h),

                // Venue Selection
                SectionHeader(title: AppStrings.venueSelection),
                SizedBox(height: AppSizes.spacingLarge.h),
                MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: AppSizes.gridCrossAxisCount,
                  mainAxisSpacing: AppSizes.gridSpacing,
                  crossAxisSpacing: AppSizes.gridSpacing,
                  itemCount: controller.restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = controller.restaurants[index];
                    return RestaurantCard(
                      restaurant: restaurant,
                      height: AppSizes.restaurantCardBaseHeight +
                          (index % 3) * AppSizes.restaurantCardStagger,
                      onTap: () => controller.onRestaurantTap(restaurant),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
