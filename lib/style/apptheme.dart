import 'package:flutter/material.dart';
import 'package:news/style/appcolors.dart';

class AppThemes{


  static final ThemeData lightTheme=ThemeData(
    primaryColor: AppColors.blackColor,
      primaryColorLight:AppColors.whiteColor ,
      scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(
        color: AppColors.blackColor
      )
    )

  );
  static final ThemeData darkTheme=ThemeData(
     primaryColor: AppColors.whiteColor,
      primaryColorLight:AppColors.blackColor ,

      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blackColor
      ),
      iconTheme: IconThemeData(
      color: AppColors.whiteColor
  )
  );
}