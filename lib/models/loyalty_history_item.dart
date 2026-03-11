class LoyaltyHistoryItem {
  final String restaurantName;
  final String imagePath;
  final String date;
  final String amount;
  final int creditsEarned;
  final int totalCredits;

  const LoyaltyHistoryItem({
    required this.restaurantName,
    required this.imagePath,
    required this.date,
    required this.amount,
    required this.creditsEarned,
    required this.totalCredits,
  });
}
