import 'package:flutter/material.dart';
import 'package:dpapp/utilities/hex_color.dart';

ThemeData appTheme() {
  final primaryColor = HexColor('#E2EDF8');
  final surfaceColor = HexColor('#E2EDF8');

  return ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: primaryColor,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.blue),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.blue,
      surface: surfaceColor,
    ),
  );
}
