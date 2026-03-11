import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recast_designs_assessment/core/constants/app_assets.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/models/loyalty_history_item.dart';
import '../test_helpers.dart';
import 'package:recast_designs_assessment/widgets/loyalty_history_card.dart';

void main() {
  group('LoyaltyHistoryCard', () {
    final testItem = LoyaltyHistoryItem(
      restaurantName: 'Nobiko Bistro',
      imagePath: AppAssets.restaurantNobiko,
      date: '06 Jan, 2025',
      amount: '125.32 JD',
      creditsEarned: 230,
      totalCredits: 325,
    );

    testWidgets('renders without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyaltyHistoryCard(item: testItem),
          ),
        ),
      );

      expect(find.byType(LoyaltyHistoryCard), findsOneWidget);
    });

    testWidgets('displays restaurant name and date', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyaltyHistoryCard(item: testItem),
          ),
        ),
      );

      expect(find.text('Nobiko Bistro'), findsOneWidget);
      expect(find.text('06 Jan, 2025'), findsOneWidget);
    });

    testWidgets('displays credits badge', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyaltyHistoryCard(item: testItem),
          ),
        ),
      );

      expect(find.text('325 ${AppStrings.credits}'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      var tapped = false;
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyaltyHistoryCard(
              item: testItem,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(LoyaltyHistoryCard));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
