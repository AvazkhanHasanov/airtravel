import 'package:air_travel/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(surfaceTintColor: Colors.transparent, backgroundColor: AppColors.white),
  );
}
