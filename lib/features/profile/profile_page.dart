import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:recast_designs_assessment/core/constants/app_assets.dart';
import 'package:recast_designs_assessment/core/constants/app_fonts.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/widgets/loyalty_history_card.dart';
import 'package:recast_designs_assessment/widgets/profile_section_info.dart';
import './profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: false,
            pinned: true,
            backgroundColor: Colors.black,
            title: Text(
              AppStrings.yourProfile,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              IconButton(
                onPressed: controller.onSettingsTap,
                icon: Image.asset(
                  AppAssets.settings,
                  width: AppSizes.iconSizeLg.w,
                  height: AppSizes.iconSizeLg.w,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingHorizontal.w,
              ),
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
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingHorizontal.w,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                controller.loyaltyHistory
                    .map(
                      (item) => LoyaltyHistoryCard(
                        item: item,
                        onTap: () => controller.onLoyaltyCardTap(item),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppSizes.spacingXXLarge.h),
          ),
        ],
      ),
    );
  }
}
