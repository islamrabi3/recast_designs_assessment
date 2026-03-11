import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recast_designs_assessment/core/constants/app_colors.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/features/home/home_controller.dart';
import 'package:recast_designs_assessment/routes.dart';

class WelcomeAndProfileWidget extends GetView<HomeController> {
  const WelcomeAndProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = controller.user;
    final textTheme = TextTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.welcomeBack,
              style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
            ),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.sandGold, AppColors.lightCream],
              ).createShader(bounds),
              child: Text(
                user.name,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.profile),
          child: Container(
            width: AppSizes.avatarSize.w,
            height: AppSizes.avatarSize.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade600,
                width: AppSizes.avatarBorderWidth.w,
              ),
              color: AppColors.lightGrey20,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: AppColors.lightGrey20,
              radius: AppSizes.avatarSize / 2,
              child: ClipOval(
                child: Image.asset(
                  user.profileImagePath,
                  width: AppSizes.avatarInner.w,
                  height: AppSizes.avatarInner.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
