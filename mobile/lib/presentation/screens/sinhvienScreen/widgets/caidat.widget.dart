
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';

import 'package:mobile/app/routers/app.routes.dart';
import 'package:mobile/core/notifiers/lang.notifiers.dart';
import 'package:mobile/core/notifiers/student.notifer.dart';
import 'package:mobile/presentation/screens/sinhvienScreen/widgets/showngonngu.widget.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

// ignore: non_constant_identifier_names
Widget CaiDat(
    {required BuildContext context,
    required LangNotifiers lang,
    required StudentNotifier sv}) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cài đặt",
            style: CustomTextWidget.bodyTextB3(color: Colors.black87),
          ),
          vSizedBox1,
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Card(
                  elevation: 12.0,
                  child: ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.lock_sharp,
                        color: AppColors.primary,
                        size: 30.0,
                      ),
                      title: Text(
                        "Đổi mật khẩu",
                        style: CustomTextWidget.bodyTextS14B(),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRouter.doiMatKhau);
                      },
                      trailing: Icon(
                        Icons.arrow_right_alt_outlined,
                        color: AppColors.primary,
                        size: 30.0,
                      )),
                ),
                vSizedBox1,
                Card(
                  elevation: 12.0,
                  child: ListTile(
                    title: Text(
                      "Ngôn ngữ",
                      style: CustomTextWidget.bodyTextS14B(),
                    ),
                    leading: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: getUrlImgLang(lang.locale!.languageCode)),
                      ),
                    ),
                    onTap: () => showNgonNgu(context: context, lang: lang),
                    trailing: Icon(
                      Icons.arrow_right_alt_outlined,
                      color: AppColors.primary,
                      size: 30.0,
                    ),
                  ),
                ),
                vSizedBox1,
                Card(
                  elevation: 12.0,
                  child: ListTile(
                      title: Text(
                        "Đăng Xuất",
                        style: CustomTextWidget.bodyTextS14B(),
                      ),
                      onTap: () => logout(context: context, sv: sv),
                      leading: Icon(
                        Icons.logout_sharp,
                        color: AppColors.primary,
                        weight: 100,
                        size: 30.0,
                      )),
                )
              ],
            ),
          )
        ],
      ));
}
