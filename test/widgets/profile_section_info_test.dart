import 'package:flutter_test/flutter_test.dart';

import 'package:recast_designs_assessment/core/constants/app_strings.dart';
import '../test_helpers.dart';
import 'package:recast_designs_assessment/widgets/profile_section_info.dart';

void main() {
  group('ProfileInfoSection', () {
    testWidgets('renders without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidgetWithProfileGet(
          ProfileInfoSection(onEditTap: () {}),
        ),
      );

      expect(find.byType(ProfileInfoSection), findsOneWidget);
    });

    testWidgets('displays user name from controller', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidgetWithProfileGet(
          ProfileInfoSection(onEditTap: () {}),
        ),
      );

      expect(find.text('Asmar Ajlouni'), findsOneWidget);
    });

    testWidgets('displays Edit text', (WidgetTester tester) async {
      await tester.pumpWidget(
        pumpTestWidgetWithProfileGet(
          ProfileInfoSection(onEditTap: () {}),
        ),
      );

      expect(find.text(AppStrings.edit), findsOneWidget);
    });

    testWidgets('calls onEditTap when Edit is tapped', (WidgetTester tester) async {
      var tapped = false;
      await tester.pumpWidget(
        pumpTestWidgetWithProfileGet(
          ProfileInfoSection(onEditTap: () => tapped = true),
        ),
      );

      await tester.tap(find.text(AppStrings.edit));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
