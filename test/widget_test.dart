import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:final_project/screens/main_shell.dart';
import 'package:final_project/theme.dart';

void main() {
  testWidgets('Start Brewing opens the Ratio Calculator', (tester) async {
    await tester.pumpWidget(
      MaterialApp(theme: appTheme, home: const MainShell()),
    );

    expect(find.text('Start Brewing'), findsOneWidget);

    await tester.tap(find.text('Start Brewing'));
    await tester.pumpAndSettle();

    expect(find.text('Ratio Calculator'), findsOneWidget);
  });

  testWidgets('Nav bar opens the Grind Setting screen', (tester) async {
    await tester.pumpWidget(
      MaterialApp(theme: appTheme, home: const MainShell()),
    );

    await tester.tap(find.text('Grind'));
    await tester.pumpAndSettle();

    expect(find.text('Grind Setting'), findsOneWidget);
  });
}