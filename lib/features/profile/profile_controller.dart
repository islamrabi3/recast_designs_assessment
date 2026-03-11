import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/data/mock/mock_data.dart';
import 'package:recast_designs_assessment/models/loyalty_history_item.dart';
import 'package:recast_designs_assessment/models/user.dart';

class ProfileController extends GetxController {
  User get user => MockData.currentUser;
  List<LoyaltyHistoryItem> get loyaltyHistory => MockData.loyaltyHistory;

  void onLoyaltyCardTap(LoyaltyHistoryItem item) {
    Get.snackbar(
      item.restaurantName,
      '${item.amount} • ${item.totalCredits} ${AppStrings.credits}',
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
    );
  }

  void onSettingsTap() {
    Get.snackbar(
      AppStrings.settings,
      AppStrings.settingsComingSoon,
      colorText: Colors.white,
    );
  }

  void onEditTap() {
    Get.snackbar(
      AppStrings.editProfile,
      AppStrings.editComingSoon,
      colorText: Colors.white,
    );
  }
}
