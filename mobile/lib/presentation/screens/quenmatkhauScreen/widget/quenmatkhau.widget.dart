import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

// ignore: non_constant_identifier_names
Widget TextQuenMatKhau({required bool themeFlag}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
    child: Center(
      child: Column(
        children: [
          vSizedBox2,
          Text(
            "Bạn đã quên mật khẩu",
            style: CustomTextWidget.bodyTextB1(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
          Text(
            "tài khoản của mình?",
            style: CustomTextWidget.bodyTextB1(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
          vSizedBox2,
          Text(
            "Vui lòng nhập các thông tin xác thực dưới đây để yêu cầu đặt lại mật khẩu mặc định cho tài khoản của bạn",
            textAlign: TextAlign.justify,
            style: CustomTextWidget.bodyText3(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
        ],
      ),
    ),
  );
}
