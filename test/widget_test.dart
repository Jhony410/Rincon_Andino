import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rincon_andino/main.dart';

void main() {
  testWidgets('App loads and starts without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Verify that the MaterialApp.router is initialized.
    expect(find.byType(MaterialApp), findsOneWidget);

    // Wait for the splash screen's 3-second redirect timer to fire and settle
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
