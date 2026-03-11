import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/core/constants/app_sizes.dart';
import 'package:recast_designs_assessment/features/profile/profile_controller.dart';
import 'package:recast_designs_assessment/widgets/loyalty_history_card.dart';

class ProfileSliverList extends StatelessWidget {
  const ProfileSliverList({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal.w),
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
    );
  }
}
