/// Summary of loyalty points and progress for the home screen.
class LoyaltySummary {
  final String brandName;
  final String loyaltyTitle;
  final int points;
  final double progressValue;
  final int totalOrders;
  final List<String> rewardImagePaths;

  const LoyaltySummary({
    required this.brandName,
    required this.loyaltyTitle,
    required this.points,
    required this.progressValue,
    required this.totalOrders,
    required this.rewardImagePaths,
  });
}
