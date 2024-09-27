import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.fonts.dart';

class CustomDataEntyWidget {
  // ignore: non_constant_identifier_names
  static Widget KhongCoDuLieu() {
    return const Center(
      child: Text(
        'Không có dữ liệu...',
        style: TextStyle(
            fontSize: 20.0,
            fontFamily: AppFonts.lato,
            fontWeight: FontWeight.w900,
            color: Colors.black),
      ),
    );
  }
}
