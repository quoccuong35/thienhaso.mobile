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

  static String customExceptionStatusCodeApi(int statusCode, String url) {
    String kq = '';
    switch (statusCode) {
      case 401:
        kq = "Chưa cáp quyền truy cập 401";
        break;
      case 415:
        kq = "Yêu cầu kiểu dữ liệu không hợp lệ 415";
        break;
      case 404:
        kq = "Không tìm thấy url $url trên hệ thống 404";
        break;
      case 400:
        kq = "Yêu cầu không hợp lệ 400";
        break;
      default:
        kq = "Lỗi hệ thống liên hệ quản trị $statusCode";
        break;
    }
    return kq;
  }
}
