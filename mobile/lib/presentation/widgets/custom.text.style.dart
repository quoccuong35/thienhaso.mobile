import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.functions.dart';
import 'package:mobile/core/models/style.dart';
import '../../app/constants/app.fonts.dart';

class CustomTextWidget {
  static valueStyle(Style? style) {
    if (style != null) {
      return TextStyle(
          color: style.foreColor != null
              ? AppFunctions.getColorFromHex(style.foreColor)
              : null,
          fontSize: style.fontSize != null && style.fontSize! > 0.0
              ? style.fontSize
              : AppFonts.fontSize14,
          fontWeight: style.bold! ? FontWeight.bold : null,
          fontFamily: AppFonts.lato,
          overflow: TextOverflow.ellipsis,
          fontStyle: style.italic! ? FontStyle.italic : null);
    } else {
      return bodyTextS14B();
    }
  }

  static captionStyle(Style? style) {
    if (style != null) {
      return TextStyle(
          color: style.foreColor != null
              ? AppFunctions.getColorFromHex(style.foreColor)
              : null,
          fontSize: style.fontSize != null && style.fontSize! > 0.0
              ? style.fontSize
              : AppFonts.fontSize14,
          fontWeight: style.bold! ? FontWeight.bold : null,
          fontFamily: AppFonts.lato,
          overflow: TextOverflow.ellipsis,
          fontStyle: style.italic! ? FontStyle.italic : null);
    } else {
      return bodyTextS14();
    }
  }

  static foodter() {
    return TextStyle(
      color: AppColors.white,
      fontSize: AppFonts.fontSize12,
      fontFamily: AppFonts.lato,
      overflow: TextOverflow.ellipsis,
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
      overflow: TextOverflow.ellipsis,
    );
  }

  static bodyTextTitle() {
    return TextStyle(
      fontFamily: AppFonts.lato,
      color: AppColors.black,
      fontWeight: FontWeight.w900,
      fontSize: AppFonts.fontSize20,
      overflow: TextOverflow.ellipsis,
    );
  }

  static bodyTextB3({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.lato,
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: AppFonts.fontSize16,
      overflow: TextOverflow.ellipsis,
    );
  }

  static bodyTextUltra({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.contax,
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: AppFonts.fontSize28,
      overflow: TextOverflow.ellipsis,
    );
  }

  static bodyText3({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.lato,
      color: color,
      fontSize: AppFonts.fontSize14,
      overflow: TextOverflow.clip,
    );
  }

  static bodyTextS14W6() {
    return const TextStyle(
        fontFamily: AppFonts.lato,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.black,
        overflow: TextOverflow.clip);
  }

  static bodyTextS14() {
    return const TextStyle(
        color: Colors.black,
        fontFamily: AppFonts.lato,
        fontSize: 14,
        overflow: TextOverflow.clip);
  }

  static bodyTextS14W6red() {
    return const TextStyle(
      fontFamily: AppFonts.lato,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Colors.red,
      overflow: TextOverflow.ellipsis,
    );
  }

  static bodyTextS14Cblue() {
    return TextStyle(
      fontFamily: AppFonts.lato,
      fontSize: 14,
      color: AppColors.primary,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
    );
  }

  static bodyTextS14B() {
    return TextStyle(
      fontFamily: AppFonts.lato,
      fontSize: 14,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.clip,
    );
  }

  static bodyTextS14CGreen() {
    return TextStyle(
      fontFamily: AppFonts.lato,
      fontSize: 14,
      color: AppColors.green,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
    );
  }

  static bodyTextS16W9() {
    return const TextStyle(
      fontFamily: AppFonts.lato,
      fontWeight: FontWeight.w900,
      fontSize: AppFonts.fontSize16,
      color: Colors.black,
      overflow: TextOverflow.ellipsis,
    );
  }

  static bodyTextS14WwhiteW7() {
    return const TextStyle(
      fontFamily: AppFonts.lato,
      fontWeight: FontWeight.w700,
      fontSize: AppFonts.fontSize14,
      color: Colors.white,
      overflow: TextOverflow.ellipsis,
    );
  }
}
