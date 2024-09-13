// routes.dart
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/reset_password_screen.dart';
import 'screens/home_screen.dart';
import 'screens/container_list_screen.dart';
import 'screens/settings_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String signup = '/signup';
  static const String resetPassword = '/reset_password';
  static const String home = '/home';
  static const String containers = '/containers';
  static const String settings = '/settings';

  static final routes = {
    login: (context) => LoginScreen(),
    signup: (context) => SignUpScreen(),
    resetPassword: (context) => ResetPasswordScreen(),
    home: (context) => HomeScreen(),
    containers: (context) => ContainerListScreen(),
    settings: (context) => SettingsScreen(),
  };
}
