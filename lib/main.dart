import 'package:baby_madics/navigation_home_screen.dart';
import 'package:baby_madics/screens/otp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/otpScreen': (BuildContext ctx) => OtpScreen(),
        '/loginScreen': (BuildContext ctx) => LoginScreen(),
        '/homeScreen': (BuildContext ctx) => NavigationHomeScreen(),
      },
    );
  }
}
