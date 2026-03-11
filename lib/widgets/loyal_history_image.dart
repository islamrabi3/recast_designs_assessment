import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/models/loyalty_history_item.dart';

class LoyalHistoryImage extends StatelessWidget {
  const LoyalHistoryImage({super.key, required this.item});

  final LoyaltyHistoryItem item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.radiusSmall.r),
      child: SizedBox(
        width: AppSizes.loyaltyCardImageSize.sp,
        height: AppSizes.loyaltyCardImageSize.sp,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: Colors.black),
            Center(
              child: SizedBox(
                width: AppSizes.loyaltyCardImageInner.sp,
                height: AppSizes.loyaltyCardImageInner.sp,
                child: Image.asset(item.imagePath, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
