import 'package:flutter/material.dart';

import 'app.colors.dart';
import 'app.fonts.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.creamColor,
    brightness: Brightness.dark,
    primary: AppColors.mirage,
  ),
  indicatorColor: AppColors.rawSienna,
  dividerColor: Colors.white54,
  fontFamily: AppFonts.lato,
);

final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.mirage,
      brightness: Brightness.light,
      surface: AppColors.creamColor,
    ),
    indicatorColor: AppColors.rawSienna,
    dividerColor: Colors.black,
    fontFamily: AppFonts.lato,
    scaffoldBackgroundColor: AppColors.white);
