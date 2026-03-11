import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recast_designs_assessment/widgets/section_header.dart';

import '../test_helpers.dart';

void main() {
  group('SectionHeader', () {
    testWidgets('displays the given title', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          const Scaffold(body: SectionHeader(title: 'Venue Selection')),
        ),
      );

      expect(find.text('Venue Selection'), findsOneWidget);
    });

    testWidgets('renders without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidget(
          const Scaffold(body: SectionHeader(title: 'Test Title')),
        ),
      );

      expect(find.byType(SectionHeader), findsOneWidget);
    });
  });
}
