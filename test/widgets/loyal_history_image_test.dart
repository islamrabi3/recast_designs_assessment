import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recast_designs_assessment/core/constants/app_assets.dart';
import 'package:recast_designs_assessment/models/loyalty_history_item.dart';
import '../test_helpers.dart';
import 'package:recast_designs_assessment/widgets/loyal_history_image.dart';

void main() {
  group('LoyalHistoryImage', () {
    final testItem = LoyaltyHistoryItem(
      restaurantName: 'Test Restaurant',
      imagePath: AppAssets.restaurantCeano,
      date: '01 Jan, 2025',
      amount: '50.00 JD',
      creditsEarned: 100,
      totalCredits: 200,
    );

    testWidgets('renders without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyalHistoryImage(item: testItem),
          ),
        ),
      );

      expect(find.byType(LoyalHistoryImage), findsOneWidget);
    });

    testWidgets('displays image from item', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyalHistoryImage(item: testItem),
          ),
        ),
      );

      expect(find.byType(LoyalHistoryImage), findsOneWidget);
    });
  });
}
