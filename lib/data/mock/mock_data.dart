import 'package:recast_designs_assessment/core/constants/app_assets.dart';
import 'package:recast_designs_assessment/models/loyalty_history_item.dart';
import 'package:recast_designs_assessment/models/loyalty_summary.dart';
import 'package:recast_designs_assessment/models/restaurant.dart';
import 'package:recast_designs_assessment/models/user.dart';

class MockData {
  static const User currentUser = User(
    name: 'Asmar Ajlouni',
    phoneNumber: '+962 234 567 2349',
    profileImagePath: AppAssets.profileImage,
  );

  static const LoyaltySummary loyaltySummary = LoyaltySummary(
    brandName: 'AlterNow',
    loyaltyTitle: 'Loyalty Points',
    points: 21750,
    progressValue: 0.7,
    totalOrders: 10,
    rewardImagePaths: [AppAssets.reward1, AppAssets.reward2, AppAssets.reward3],
  );

  static const List<Restaurant> restaurants = [
    Restaurant(
      name: 'Ceano',
      category: 'Nikkei',
      imagePath: AppAssets.restaurantCeano,
    ),
    Restaurant(
      name: 'Nobiko',
      category: 'Restaurant',
      imagePath: AppAssets.restaurantNobiko,
    ),
    Restaurant(
      name: 'Dovely',
      category: 'Casual',
      imagePath: AppAssets.restaurantDovely,
    ),
    Restaurant(
      name: 'Olivestree',
      category: 'Bakery',
      imagePath: AppAssets.restaurantOlivestree,
    ),
  ];

  static const List<LoyaltyHistoryItem> loyaltyHistory = [
    LoyaltyHistoryItem(
      restaurantName: 'Nobiko Bistro',
      imagePath: AppAssets.reward2,
      date: '06 Jan, 2025',
      amount: '125.32 JD',
      creditsEarned: 230,
      totalCredits: 325,
    ),
    LoyaltyHistoryItem(
      restaurantName: 'Ceano',
      imagePath: AppAssets.reward2,
      date: '05 Jan, 2025',
      amount: '89.50 JD',
      creditsEarned: 165,
      totalCredits: 490,
    ),
    LoyaltyHistoryItem(
      restaurantName: 'Dovely',
      imagePath: AppAssets.reward2,
      date: '04 Jan, 2025',
      amount: '156.00 JD',
      creditsEarned: 310,
      totalCredits: 325,
    ),
    LoyaltyHistoryItem(
      restaurantName: 'Olivestree',
      imagePath: AppAssets.reward2,
      date: '03 Jan, 2025',
      amount: '42.75 JD',
      creditsEarned: 85,
      totalCredits: 410,
    ),
  ];
}
