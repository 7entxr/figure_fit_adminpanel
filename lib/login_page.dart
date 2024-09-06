import 'package:flutter/material.dart';
import 'package:figure_fit_adminpanel/cart_products.dart';
import 'package:figure_fit_adminpanel/dashboard.dart';
import 'package:figure_fit_adminpanel/discounts_and_banners.dart';
import 'package:figure_fit_adminpanel/gift_box.dart';
import 'package:figure_fit_adminpanel/manage_orders_screen.dart';
import 'package:figure_fit_adminpanel/products_screen.dart';
import 'package:figure_fit_adminpanel/ratings.dart';
import 'package:figure_fit_adminpanel/settings.dart';
import 'package:figure_fit_adminpanel/user_profile_screen.dart';
import 'package:figure_fit_adminpanel/wishlist_product.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SideNavigationExampleState();
}

class _SideNavigationExampleState extends State<LoginPage> {
  String _selectedPage = 'Dashboard';
  double _containerWidth = 300.0; // Initial width

  void _toggleDrawer() {
    setState(() {
      _containerWidth = _containerWidth == 300.0 ? 86.0 : 300.0; // Toggle between 300 and 86 width
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Side Navigation Container
          AnimatedContainer(
            width: _containerWidth,
            duration: Duration(milliseconds: 300), // Animation duration
            color: Color(0xFF1D1D3F), // Updated color to 1D1D3F
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0), // Adjust padding as needed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and icon
                    children: [
                      _containerWidth == 300.0
                          ? Text(
                        'Admin.', // Replace with your desired text
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34, // Adjust font size as needed
                          fontWeight: FontWeight.bold, // Optional: Adjust font weight
                        ),
                      )
                          : Container(), // Hide text when the width is minimized
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.white, size: 30),
                        onPressed: _toggleDrawer, // Toggle width on icon press
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      _buildNavItem('Dashboard', Icons.dashboard),
                      _buildNavItem('Manage Orders', Icons.list),
                      _buildNavItem('Products', Icons.shopping_bag),
                      _buildNavItem('User Profile', Icons.person),
                      _buildNavItem('Wishlist Product', Icons.favorite),
                      _buildNavItem('Cart Products', Icons.shopping_cart),
                      _buildNavItem('Ratings', Icons.star),
                      _buildNavItem('Discounts & Banners', Icons.local_offer),
                      _buildNavItem('Gift Box', Icons.wallet_giftcard),
                      _buildNavItem('Settings', Icons.settings),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: _getSelectedPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, IconData icon) {
    bool isSelected = _selectedPage == title;
    return Container(
      color: isSelected ? Color(0xFF27274F) : Colors.transparent, // Change color when selected
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 20, // Adjust icon size as needed
        ),
        title: _containerWidth == 300.0
            ? Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16, // Adjust font size as needed
            fontWeight: FontWeight.w500, // Adjust font weight as needed
          ),
        )
            : null, // Hide title text when the width is minimized
        onTap: () {
          setState(() {
            _selectedPage = title;
          });
          _navigateToPage(title);
        },
      ),
    );
  }

  void _navigateToPage(String page) {
    String routeName;
    switch (page) {
      case 'Manage Orders':
        routeName = '/manage-orders';
        break;
      case 'Products':
        routeName = '/products';
        break;
      case 'User Profile':
        routeName = '/user-profile';
        break;
      case 'Wishlist Product':
        routeName = '/wishlist-product';
        break;
      case 'Cart Products':
        routeName = '/cart-products';
        break;
      case 'Ratings':
        routeName = '/ratings';
        break;
      case 'Discounts & Banners':
        routeName = '/discounts-banners';
        break;
      case 'Gift Box':
        routeName = '/gift-box';
        break;
      case 'Settings':
        routeName = '/settings';
        break;
      case 'Dashboard':
      default:
        routeName = '/dashboard';
        break;
    }
    Navigator.pushNamed(context, routeName);
  }

  Widget _getSelectedPage() {
    switch (_selectedPage) {
      case 'Manage Orders':
        return ManageOrdersScreen();
      case 'Products':
        return ProductsScreen();
      case 'User Profile':
        return UserProfileScreen();
      case 'Wishlist Product':
        return WishlistProductScreen();
      case 'Cart Products':
        return CartProductsScreen();
      case 'Ratings':
        return RatingsScreen();
      case 'Discounts & Banners':
        return DiscountsAndBannersScreen();
      case 'Gift Box':
        return GiftBoxScreen();
      case 'Settings':
        return SettingsScreen();
      case 'Dashboard':
      default:
        return DashboardScreen();
    }
  }
}

// Main entry point of the app
void main() {
  runApp(MaterialApp(
    initialRoute: '/dashboard', // Set initial route
    routes: {
      '/dashboard': (context) => DashboardScreen(),
      '/manage-orders': (context) => ManageOrdersScreen(),
      '/products': (context) => ProductsScreen(),
      '/user-profile': (context) => UserProfileScreen(),
      '/wishlist-product': (context) => WishlistProductScreen(),
      '/cart-products': (context) => CartProductsScreen(),
      '/ratings': (context) => RatingsScreen(),
      '/discounts-banners': (context) => DiscountsAndBannersScreen(),
      '/gift-box': (context) => GiftBoxScreen(),
      '/settings': (context) => SettingsScreen(),
    },
    home: LoginPage(),
  ));
}
