import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/core/constants/app_assets.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/features/profile/profile_controller.dart';

class ProfileSliverAppBar extends StatelessWidget {
  const ProfileSliverAppBar({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
    );
  }
}
