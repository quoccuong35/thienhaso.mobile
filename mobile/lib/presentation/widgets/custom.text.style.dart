import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import '../../app/constants/app.fonts.dart';

class CustomTextWidget {
  static foodter() {
    return TextStyle(
      color: AppColors.white,
      fontSize: AppFonts.fontSize12,
      fontFamily: AppFonts.lato,
    );
  }

  static appBarStyle() {
    return TextStyle(
        fontFamily: AppFonts.lato,
        color: AppColors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w900,
        overflow: TextOverflow.ellipsis);
  }

  static bodyTextB1({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.lato,
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: AppFonts.fontSize22,
    );
  }

  static bodyTextTitle() {
    return TextStyle(
      fontFamily: AppFonts.lato,
      color: AppColors.black,
      fontWeight: FontWeight.w900,
      fontSize: AppFonts.fontSize20,
    );
  }

  static bodyTextB3({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.lato,
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: AppFonts.fontSize16,
    );
  }

  static bodyTextUltra({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.contax,
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: AppFonts.fontSize28,
    );
  }

  static bodyText3({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.lato,
      color: color,
      fontSize: AppFonts.fontSize14,
    );
  }

  static bodyTextS14W6() {
    return const TextStyle(
        fontFamily: AppFonts.lato,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.black87,
        overflow: TextOverflow.clip);
  }

  static bodyTextS14W6red() {
    return const TextStyle(
      fontFamily: AppFonts.lato,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Colors.red,
    );
  }

  static bodyTextS14Cblue() {
    return TextStyle(
      fontFamily: AppFonts.lato,
      fontSize: 14,
      color: AppColors.primary,
      fontWeight: FontWeight.bold,
    );
  }

  static bodyTextS14B() {
    return TextStyle(
      fontFamily: AppFonts.lato,
      fontSize: 14,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
    );
  }

  static bodyTextS14CGreen() {
    return TextStyle(
      fontFamily: AppFonts.lato,
      fontSize: 14,
      color: AppColors.green,
      fontWeight: FontWeight.bold,
    );
  }

  static bodyTextS16W9() {
    return const TextStyle(
      fontFamily: AppFonts.lato,
      fontWeight: FontWeight.w900,
      fontSize: AppFonts.fontSize16,
      color: Colors.black,
    );
  }
}
