import 'package:flutter/material.dart';

class AppStyles {
  // App Theme
  static ThemeData appTheme = ThemeData(
    primarySwatch: Colors.blue,
    useMaterial3: true,
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  // Text Styles
  static const TextStyle bigTextStyle = TextStyle(fontSize: 18);
}