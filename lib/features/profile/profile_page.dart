import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/widgets/profile_sliver_appbar.dart';
import 'package:recast_designs_assessment/widgets/profile_sliver_list.dart';
import 'package:recast_designs_assessment/widgets/profile_user_info.dart';
import './profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          ProfileSliverAppBar(controller: controller),
          ProfileSliverUserInfo(controller: controller),
          ProfileSliverList(controller: controller),
          SliverToBoxAdapter(
            child: SizedBox(height: AppSizes.spacingXXLarge.h),
          ),
        ],
      ),
    );
  }
}
