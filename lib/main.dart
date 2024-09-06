import 'package:figure_fit_adminpanel/login_page.dart';
import 'package:flutter/material.dart';
import 'package:figure_fit_adminpanel/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyABZsJFHkzXN0OoCNERRogRC0JNdWPuGxE",
        authDomain: "figure-fit-official.firebaseapp.com",
        databaseURL: "https://figure-fit-official-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "figure-fit-official",
        storageBucket: "figure-fit-official.appspot.com",
        messagingSenderId: "996608668596",
        appId: "1:996608668596:web:0d5ea9c718ecc31cf4f8e1",
        measurementId: "G-DKVE5WCQ4V"
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
      home: const LoginPage(), // Navigate to the SignInPage
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}
