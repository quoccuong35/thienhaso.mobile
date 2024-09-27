import 'package:flutter/material.dart';

class AppFunctions {
  static DateTime startDateTheWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  static DateTime lastDateTheWeek(DateTime date) {
    return date.add(Duration(days: DateTime.daysPerWeek - date.weekday));
  }

  static Color? getColorFromHex(String? hexColor) {
    if (hexColor!.isEmpty) return null;
    try {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      }
      final hexNum = int.parse(hexColor, radix: 16);

      if (hexNum == 0) {
        return const Color(0xff000000);
      }
      return Color(hexNum);
    } catch (e) {
      return null;
    }
  }
}
