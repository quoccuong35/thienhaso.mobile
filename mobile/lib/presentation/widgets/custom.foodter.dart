import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

// ignore: non_constant_identifier_names
Widget CustomFootder() {
  return Container(
    height: 55.0,
    color: AppColors.primary,
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Image(
              image: AssetImage("images/logo.png"),
              height: 50.0,
              width: 50.0,
            ),
            hSizedBox1,
            Expanded(
                flex: 7,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Úng dụng quản lý sinh viên",
                          style: CustomTextWidget.foodter()),
                      Text("©2024 thienhaso.com",
                          style: CustomTextWidget.foodter())
                    ],
                  ),
                )),
          ],
        )),
  );
}
