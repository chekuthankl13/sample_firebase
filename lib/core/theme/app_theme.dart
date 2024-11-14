import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true, 
    scaffoldBackgroundColor: Colors.white, 
    appBarTheme:const AppBarTheme(
      surfaceTintColor: Colors.transparent, 
      backgroundColor: Colors.black, 
      foregroundColor: Colors.white
    )
  );
}