import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:figure_fit_adminpanel/main.dart'; // Import the correct package path
import 'package:figure_fit_adminpanel/dashboard.dart';
import 'package:figure_fit_adminpanel/manage_orders_screen.dart';
import 'package:figure_fit_adminpanel/products_screen.dart';
import 'package:figure_fit_adminpanel/user_profile_screen.dart';
import 'package:figure_fit_adminpanel/wishlist_product.dart';
import 'package:figure_fit_adminpanel/cart_products.dart';
import 'package:figure_fit_adminpanel/ratings.dart';
import 'package:figure_fit_adminpanel/discounts_and_banners.dart';
import 'package:figure_fit_adminpanel/gift_box.dart';
import 'package:figure_fit_adminpanel/settings.dart';

void main() {
  testWidgets('Navigation and drawer functionality test', (WidgetTester tester) async {
    // Build the LoginPage widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Verify initial state: should display Dashboard content.
    expect(find.text('Dashboard'), findsOneWidget);

    // Verify the side navigation items are present.
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Manage Orders'), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
    expect(find.text('User Profile'), findsOneWidget);
    expect(find.text('Wishlist Product'), findsOneWidget);
    expect(find.text('Cart Products'), findsOneWidget);
    expect(find.text('Ratings'), findsOneWidget);
    expect(find.text('Discounts & Banners'), findsOneWidget);
    expect(find.text('Gift Box'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);

    // Tap on the "Manage Orders" menu item and verify navigation.
    await tester.tap(find.text('Manage Orders'));
    await tester.pumpAndSettle(); // Wait for navigation to complete.

    expect(find.byType(ManageOrdersScreen), findsOneWidget);

    // Tap on the menu icon to toggle the drawer width.
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump(); // Trigger the animation.

    // Verify that the drawer width is minimized by checking visibility of text.
    expect(find.text('Admin.'), findsNothing);

    // Tap the menu icon again to expand the drawer.
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump(); // Trigger the animation.

    // Verify that the drawer width is expanded and text is visible.
    expect(find.text('Admin.'), findsOneWidget);

    // Test other navigations similarly.
    await tester.tap(find.text('Products'));
    await tester.pumpAndSettle();
    expect(find.byType(ProductsScreen), findsOneWidget);

    await tester.tap(find.text('User Profile'));
    await tester.pumpAndSettle();
    expect(find.byType(UserProfileScreen), findsOneWidget);

    // Continue with other navigations as needed.
  });
}

