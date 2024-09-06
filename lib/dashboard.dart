import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DashboardScreen')),
      body: Center(child: Text('DashboardScreen Page', style: TextStyle(fontSize: 24))),
    );
  }
}
