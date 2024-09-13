// screens/login_screen.dart
import 'package:flutter/material.dart';
import '../routes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo
                Image.asset(
                  'assets/images/dplock_logo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 48),
                Text(
                  'DPLOCK',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 48),
                TextField(decoration: InputDecoration(labelText: 'Email')),
                SizedBox(height: 16),
                TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true),
                SizedBox(height: 24),
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                ),
                SizedBox(height: 16),
                TextButton(
                  child: Text('Sign Up'),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signup);
                  },
                ),
                TextButton(
                  child: Text('Forgot Password?'),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.resetPassword);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
