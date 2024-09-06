import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:figure_fit_adminpanel/login_page.dart'; // Import your LoginPage
import 'package:figure_fit_adminpanel/dashboard.dart';  // Import your DashboardScreen

void main() {
  testWidgets('LoginPage shows Admin text and navigates to Dashboard', (WidgetTester tester) async {
    // Build LoginPage and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Verify that the "Admin." text is found when the drawer is expanded.
    expect(find.text('Admin.'), findsOneWidget);

    // Find the 'Dashboard' text in the navigation list and tap on it
    await tester.tap(find.text('Dashboard'));
    await tester.pump(); // Rebuild the widget after the state has changed

    // Verify that the DashboardScreen is shown after the tap
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
