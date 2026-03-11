import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import '../test_helpers.dart';
import 'package:recast_designs_assessment/widgets/welcome_widget.dart';

void main() {
  group('WelcomeAndProfileWidget', () {
    void setViewport(WidgetTester tester) {
      tester.view.physicalSize = const ui.Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
    }

    Widget wrapWithScaffold() => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: const WelcomeAndProfileWidget(),
          ),
        );

    testWidgets('renders without crashing', (WidgetTester tester) async {
      setViewport(tester);
      await tester.pumpWidget(
        pumpTestWidgetWithGet(wrapWithScaffold()),
      );

      expect(find.byType(WelcomeAndProfileWidget), findsOneWidget);
    });

    testWidgets('displays welcome back text', (WidgetTester tester) async {
      setViewport(tester);
      await tester.pumpWidget(
        pumpTestWidgetWithGet(wrapWithScaffold()),
      );

      expect(find.text(AppStrings.welcomeBack), findsOneWidget);
    });

    testWidgets('displays user name from controller', (WidgetTester tester) async {
      setViewport(tester);
      await tester.pumpWidget(
        pumpTestWidgetWithGet(wrapWithScaffold()),
      );

      expect(find.text('Asmar Ajlouni'), findsOneWidget);
    });
  });
}
