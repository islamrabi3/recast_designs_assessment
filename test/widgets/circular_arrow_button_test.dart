import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recast_designs_assessment/widgets/circular_arrow_button.dart';

import '../test_helpers.dart';

void main() {
  group('CircularArrowButton', () {
    testWidgets('renders without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          const Scaffold(
            body: CircularArrowButton(),
          ),
        ),
      );

      expect(find.byType(CircularArrowButton), findsOneWidget);
    });

    testWidgets('displays arrow icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          const Scaffold(
            body: CircularArrowButton(),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);
    });
  });
}
