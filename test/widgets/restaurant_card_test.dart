import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recast_designs_assessment/core/constants/app_assets.dart';
import 'package:recast_designs_assessment/models/restaurant.dart';
import '../test_helpers.dart';
import 'package:recast_designs_assessment/widgets/restaurant_card.dart';

void main() {
  group('RestaurantCard', () {
    final testRestaurant = Restaurant(
      name: 'Test Restaurant',
      category: 'Nikkei',
      imagePath: AppAssets.restaurantCeano,
    );

    testWidgets('renders without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: RestaurantCard(
              restaurant: testRestaurant,
              height: 200,
            ),
          ),
        ),
      );

      expect(find.byType(RestaurantCard), findsOneWidget);
    });

    testWidgets('displays restaurant name and category', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: RestaurantCard(
              restaurant: testRestaurant,
              height: 200,
            ),
          ),
        ),
      );

      expect(find.text('Test Restaurant'), findsOneWidget);
      expect(find.text('Nikkei'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      var tapped = false;
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: RestaurantCard(
              restaurant: testRestaurant,
              height: 200,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RestaurantCard));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
