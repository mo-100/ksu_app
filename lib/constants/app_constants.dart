import 'package:flutter/material.dart';

class AppConstants {
  static const Color mainColor = Color.fromARGB(255, 255, 255, 255);

  static const Color secondaryColor = Color(0xFF0084bd);
  static const Color borderColor = Color.fromARGB(255, 0, 84, 119);

  static const Color confirmColor = Color.fromARGB(255, 0, 0, 0);
  static const Color secondaryConfirmColor = Color(0xFF5a8842);
  static const List<Color> gradient = [Color.fromARGB(255, 99, 164, 65), AppConstants.secondaryConfirmColor];
  static const List<Color> secondaryGradient = [ Color.fromARGB(255, 0, 82, 117), secondaryColor];



  static const Color chatColor = secondaryColor;
  static const Color chatBorderColor = borderColor;

  static const Color textColor = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryTextColor = Color.fromARGB(255, 0, 0, 0);

  static const Color iconColor = Color.fromARGB(255, 0, 0, 0);
  static const Color secondaryIconColor = Color.fromARGB(255, 255, 255, 255);

  static const Color appBarColor = secondaryColor;

  static const TextStyle textStyle = TextStyle(
    color: textColor
  );


  static const TextStyle secondaryTextStyle = TextStyle(
    color: secondaryTextColor
  );

  static ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    useMaterial3: true,
    textTheme: TextTheme(
      bodyLarge: textStyle,
      bodyMedium: textStyle,
      bodySmall: textStyle,
      displayLarge: textStyle,
      displayMedium: textStyle,
      displaySmall: textStyle,
      headlineLarge: textStyle,
      headlineMedium: textStyle,
      headlineSmall: textStyle,
      labelLarge: textStyle,
      labelMedium: textStyle,
      labelSmall: textStyle,
      titleLarge: textStyle,
      titleMedium: textStyle,
      titleSmall: textStyle,
      
    )
  );
}
