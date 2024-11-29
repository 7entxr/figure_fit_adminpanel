import 'package:figure_fit_adminpanel/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyDNXlxZ1FIk2j4WHXVIi-HJGHChXdrMkTo",
      appId: "1:749708945798:android:b7d0fca94d69719e09a407",
      messagingSenderId: "749708945798",
      storageBucket: "figure-fit-fashion-b545f.appspot.com",
      projectId: "figure-fit-fashion-b545f",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  LoginPage(), // Use const for stateless widgets
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}
