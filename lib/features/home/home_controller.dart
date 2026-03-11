import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/data/mock/mock_data.dart';
import 'package:recast_designs_assessment/models/loyalty_summary.dart';
import 'package:recast_designs_assessment/models/restaurant.dart';
import 'package:recast_designs_assessment/models/user.dart';

class HomeController extends GetxController {
  User get user => MockData.currentUser;
  List<Restaurant> get restaurants => MockData.restaurants;
  LoyaltySummary get loyaltySummary => MockData.loyaltySummary;

  void onMoreDetailsTap() {
    Get.snackbar(
      loyaltySummary.loyaltyTitle,
      AppStrings.moreDetailsComingSoon,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
    );
  }

  void onRestaurantTap(Restaurant restaurant) {
    Get.snackbar(
      restaurant.name,
      '${restaurant.category} • ${AppStrings.tapToViewDetails}',
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
    );
  }
}
