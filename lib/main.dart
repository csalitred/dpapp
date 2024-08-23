import 'package:flutter/material.dart';
import 'package:dpapp/screens/home_screens.dart';
import 'package:dpapp/theme/style.dart';
// import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DPLOCK',
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      theme: appTheme(),
      home: const HomeScreen(),
    );
  }
}
