import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/presentation/widgets/custom.back.btn.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppbar(String title, BuildContext context) {
  return AppBar(
    title: Center(
        child: Text(
      title,
      style: CustomTextWidget.appBarStyle(),
    )),
    flexibleSpace: const Image(
      image: AssetImage(AppKeys.bg),
      fit: BoxFit.cover,
    ),
    backgroundColor: Colors.transparent,
    leading: const CustomBackPop(),
  );
}
