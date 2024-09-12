import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/presentation/widgets/custom.back.btn.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

Widget HeaderWidget(
    {required BuildContext context,
    required String hoten,
    required String urlimg}) {
  return Container(
    height: 230.0,
    decoration: const BoxDecoration(
        image:
            DecorationImage(image: AssetImage(AppKeys.bg), fit: BoxFit.cover),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.15,
              child: CustomBackPop(),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.16),
              child: Text(
                "Hồ Sơ Cá Nhân",
                style: CustomTextWidget.appBarStyle(),
              ),
            ),
          ],
        ),
        Center(
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: AppColors.white),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: AppColors.white.withOpacity(0.5),
                          offset: Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          urlimg,
                        ))),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: Colors.green,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
        vSizedBox1,
        Text(hoten,
            style: TextStyle(
                fontFamily: AppFonts.lato,
                color: AppColors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w900))
      ],
    ),
  );
}

AppBar HeaderWidgetV1(
    {required BuildContext context,
    required String hoten,
    required String urlimg}) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 250.0,
    flexibleSpace: Container(
      height: 250.0,
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage(AppKeys.bg), fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
    ),
    title: SizedBox(
      height: 250.0,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                child: CustomBackPop(),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.16),
                  child: Text(
                    "Hồ Sơ Cá Nhân",
                    style: CustomTextWidget.appBarStyle(),
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: AppColors.white),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: AppColors.white.withOpacity(0.5),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            urlimg,
                          ))),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
          vSizedBox1,
          Text(hoten,
              style: TextStyle(
                  fontFamily: AppFonts.lato,
                  color: AppColors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w900))
        ],
      ),
    ),
  );
}
