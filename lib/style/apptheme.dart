import 'package:flutter/material.dart';
import 'package:news/style/appcolors.dart';

class AppThemes{


  static final ThemeData lightTheme=ThemeData(
    primaryColor: AppColors.blackColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor
    )

  );
  static final ThemeData darkTheme=ThemeData(
     primaryColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blackColor
      )
  );
}