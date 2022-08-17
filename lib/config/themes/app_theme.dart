import 'package:clean_architcture_islam/core/utils/app_colors.dart';
import 'package:clean_architcture_islam/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      fontFamily: AppStrings.fontFamily,
      hintColor: AppColors.hint,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            height: 1.3,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white),
      ));
}
