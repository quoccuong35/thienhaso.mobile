import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/app/routers/app.routes.dart';
import 'package:mobile/core/notifiers/lang.notifiers.dart';
import 'package:mobile/core/notifiers/student.notifer.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

void showNgonNgu({required LangNotifiers lang, required BuildContext context}) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'Ngôn ngữ',
            style: CustomTextWidget.bodyTextTitle(),
          ),
        ),
        content: SizedBox(
          height: 170.0,
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  lang.toggleLang(languageCode: "vi");
                },
                tileColor:
                    lang.locale!.languageCode == 'vi' ? Colors.black26 : null,
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/vn.png")),
                  ),
                ),
                title: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Tiếng việt"), Text("Tiếng việt")],
                ),
                trailing: lang.locale!.languageCode == "vi"
                    ? Icon(
                        Icons.check,
                        color: AppColors.primary,
                      )
                    : null,
              ),
              vSizedBox1,
              dividerH2B1w2,
              vSizedBox1,
              ListTile(
                onTap: () {
                  lang.toggleLang(languageCode: "en");
                },
                tileColor:
                    lang.locale!.languageCode == 'en' ? Colors.black26 : null,
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/en.png")),
                  ),
                ),
                title: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("English"), Text("Tiếng Anh")],
                ),
                trailing: lang.locale!.languageCode == "en"
                    ? Icon(
                        Icons.check,
                        color: AppColors.primary,
                      )
                    : null,
              )
            ],
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            color: Colors.red[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Thoát',
              style: TextStyle(color: AppColors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void logout({required BuildContext context, required StudentNotifier sv}) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Icon(
            Icons.logout_sharp,
            color: AppColors.primary,
            size: 36.0,
          ),
        ),
        content: const SizedBox(
          height: 100.0,
          child: Center(
            child: Text(
              "Bạn có muốn đăng xuất khỏi hệ thống",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            color: AppColors.primary.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text('Đăng Xuất',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppFonts.fontSize14,
                  fontWeight: FontWeight.w600,
                )),
            onPressed: () {
              DeleteCache.deleteKey(AppKeys.userData).whenComplete(() {
                // ignore: use_build_context_synchronously
                sv.setEmtySV();
                DeleteCache.deleteKey(AppKeys.token);
                DeleteCache.deleteKey(AppKeys.username);
                DeleteCache.deleteKey(AppKeys.studentID);
                // ignore: use_build_context_synchronously
                Navigator.of(context)
                    .pushReplacementNamed(AppRouter.loginRoute);
              });
            },
          ),
          MaterialButton(
            color: Colors.red[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Thoát',
              style: TextStyle(color: AppColors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

AssetImage getUrlImgLang(String langCode) {
  switch (langCode) {
    case 'en':
      return const AssetImage('assets/images/en.png');
    default:
      return const AssetImage('assets/images/vn.png');
  }
}
