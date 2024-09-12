import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/notifiers/lang.notifiers.dart';
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

AssetImage getUrlImgLang(String langCode) {
  switch (langCode) {
    case 'en':
      return const AssetImage('assets/images/en.png');
    default:
      return const AssetImage('assets/images/vn.png');
  }
}
