import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:figure_fit_adminpanel/login_page.dart'; // Ensure this path is correct

void main() {
  testWidgets('Basic functionality test for LoginPage', (WidgetTester tester) async {
    // Build the LoginPage widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify that the LoginPage is displayed.
    expect(find.byType(LoginPage), findsOneWidget);

    // Verify that the side navigation contains the 'Dashboard' item.
    expect(find.text('Dashboard'), findsOneWidget);

    // Tap the menu icon to toggle the drawer width.
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump(); // Trigger the animation.

    // Verify that the drawer width is minimized (optional, if you have specific checks).
    // In this example, we are not checking specific drawer width states.

    // Tap the menu icon again to expand the drawer.
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump(); // Trigger the animation.

    // Verify that the drawer width is expanded and contains the 'Dashboard' item.
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
