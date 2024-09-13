// screens/signup_screen.dart
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: 'Name')),
            TextField(decoration: InputDecoration(labelText: 'Email')),
            TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true),
            TextField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
