import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SettingsScreen')),
      body: Center(child: Text('SettingsScreen Page', style: TextStyle(fontSize: 24))),
    );
  }
}
