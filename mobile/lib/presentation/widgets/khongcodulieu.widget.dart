import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/app/constants/app.keys.dart';

class CustomDataEntyWidget {
  // ignore: non_constant_identifier_names
  static Widget KhongCoDuLieu() {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.1, // Adjust the opacity for the watermark effect
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                AppKeys.logo, width: 300, // Set the width
                height: 300, // Set the height
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Center(
          child: Text(
            'Không có dữ liệu...',
            style: TextStyle(
                fontSize: 20.0, fontFamily: AppFonts.lato, color: Colors.black),
          ),
        )
      ],
    );
  }
}
