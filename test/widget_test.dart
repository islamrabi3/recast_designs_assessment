import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';

import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import 'package:recast_designs_assessment/main.dart';

void main() {
  testWidgets('App smoke test - HomePage loads', (WidgetTester tester) async {
    tester.view.physicalSize = const ui.Size(375, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text(AppStrings.welcomeBack), findsOneWidget);
  });
}
