import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

// ignore: non_constant_identifier_names
Widget TextDoiMatKhau({required bool themeFlag}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0),
    child: Center(
      child: Column(
        children: [
          vSizedBox2,
          Text(
            "Bạn muốn đổi mật khẩu ",
            style: CustomTextWidget.bodyTextUltra(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
          Text(
            "tài khoản của mình",
            style: CustomTextWidget.bodyTextUltra(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
          vSizedBox2,
          RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(children: [
                TextSpan(
                    text:
                        "Vui lòng nhập các thông tin xác thực dưới đây để yêu cầu đặt lại mật khẩu cho tài khoản của bạn. Mật khẩu phải 8 ký tự chở lên và phải có chữ hoa, chữ thường, số và ký tự đặc biệt. ",
                    style: CustomTextWidget.bodyText3(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    )),
                TextSpan(
                    text: "Ví dụ: ",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900,
                        color: AppColors.black)),
                TextSpan(
                    text: "Abcd@1234",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary))
              ])),
        ],
      ),
    ),
  );
}
