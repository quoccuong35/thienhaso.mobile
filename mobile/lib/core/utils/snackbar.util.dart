import 'package:flutter/material.dart';
import '../../app/constants/app.colors.dart';
import '../../app/constants/app.fonts.dart';

class SnackUtil {
  static stylishSnackBar(
      {required String text, required BuildContext context}) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.black,
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.only(bottom: 10.0, left: 5, right: 5),
      elevation: 12.0,
      content: ListTile(
        leading: Icon(
          Icons.info_rounded,
          size: 36,
          color: AppColors.primary,
        ),
        title: Text(
          text,
          style: TextStyle(
              color: AppColors.creamColor,
              fontFamily: AppFonts.lato,
              overflow: TextOverflow.clip),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

showSnackBar({required String text, required BuildContext context}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackUtil.stylishSnackBar(text: text, context: context));
}
