import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/app/routers/app.routes.dart';
import 'package:mobile/core/notifiers/lang.notifiers.dart';
import 'package:mobile/core/notifiers/sinhvien.notifier.dart';
import 'package:mobile/presentation/screens/sinhvienScreen/widgets/showngonngu.widget.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

Widget CaiDat(
    {required BuildContext context,
    required LangNotifiers lang,
    required SinhVienNotifier sv}) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      padding: const EdgeInsets.all(10.0),
      color: AppColors.white,
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
                ColoredBox(
                  color: AppColors.blackShadow,
                  child: ListTile(
                      dense: true,
                      title: Text(
                        "Đổi mật khẩu",
                        style: CustomTextWidget.bodyTextS14B(),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(
                            width: 5,
                            style: BorderStyle.solid,
                            color: AppColors.black),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRouter.doiMatKhau);
                      },
                      trailing: Icon(
                        Icons.lock_sharp,
                        color: AppColors.primary,
                        size: 30.0,
                      )),
                ),
                vSizedBox1,
                ColoredBox(
                  color: AppColors.blackShadow,
                  child: ListTile(
                      title: Text(
                        "Ngôn ngữ",
                        style: CustomTextWidget.bodyTextS14B(),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            width: 2, style: BorderStyle.solid),
                      ),
                      onTap: () => showNgonNgu(context: context, lang: lang),
                      trailing: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: getUrlImgLang(lang.locale!.languageCode)),
                        ),
                      )),
                ),
                vSizedBox1,
                ColoredBox(
                  color: AppColors.blackShadow,
                  child: ListTile(
                      title: Text(
                        "Đăng Xuất",
                        style: CustomTextWidget.bodyTextS14B(),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            width: 2, style: BorderStyle.solid),
                      ),
                      onTap: () {
                        DeleteCache.deleteKey(AppKeys.userData)
                            .whenComplete(() {
                          // ignore: use_build_context_synchronously
                          sv.setEmtySV();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context)
                              .pushReplacementNamed(AppRouter.loginRoute);
                        });
                      },
                      trailing: Icon(
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
