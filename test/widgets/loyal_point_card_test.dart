import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recast_designs_assessment/core/constants/app_assets.dart';
import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/models/loyalty_summary.dart';
import '../test_helpers.dart';
import 'package:recast_designs_assessment/widgets/loyal_point_card.dart';

void main() {
  group('LoyalPointWidget', () {
    void setViewport(WidgetTester tester) {
      // Use taller viewport so LoyalPointWidget card has enough height to avoid overflow
      tester.view.physicalSize = const ui.Size(375, 1000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
    }
    final testSummary = LoyaltySummary(
      brandName: 'AlterNow',
      loyaltyTitle: 'Loyalty Points',
      points: 21750,
      progressValue: 0.7,
      totalOrders: 10,
      rewardImagePaths: [
        AppAssets.reward1,
        AppAssets.reward2,
        AppAssets.reward3,
      ],
    );

    testWidgets('renders without crashing', (WidgetTester tester) async {
      setViewport(tester);
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyalPointWidget(summary: testSummary),
          ),
        ),
      );

      expect(find.byType(LoyalPointWidget), findsOneWidget);
    });

    testWidgets('displays brand name and loyalty title', (WidgetTester tester) async {
      setViewport(tester);
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyalPointWidget(summary: testSummary),
          ),
        ),
      );

      expect(find.text('AlterNow'), findsOneWidget);
      expect(find.text('Loyalty Points'), findsOneWidget);
    });

    testWidgets('displays formatted points with comma', (WidgetTester tester) async {
      setViewport(tester);
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyalPointWidget(summary: testSummary),
          ),
        ),
      );

      expect(find.text('21,750'), findsOneWidget);
    });

    testWidgets('displays total orders label and value', (WidgetTester tester) async {
      setViewport(tester);
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyalPointWidget(summary: testSummary),
          ),
        ),
      );

      expect(find.text(AppStrings.totalOrders), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('displays More Details button', (WidgetTester tester) async {
      setViewport(tester);
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyalPointWidget(summary: testSummary),
          ),
        ),
      );

      expect(find.text(AppStrings.moreDetails), findsOneWidget);
    });

    testWidgets('calls onMoreDetailsTap when More Details is tapped', (WidgetTester tester) async {
      setViewport(tester);
      var tapped = false;
      await tester.pumpWidget(
        pumpTestWidget(
          Scaffold(
            body: LoyalPointWidget(
              summary: testSummary,
              onMoreDetailsTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(
        find.ancestor(
          of: find.text(AppStrings.moreDetails),
          matching: find.byType(GestureDetector),
        ),
      );
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
