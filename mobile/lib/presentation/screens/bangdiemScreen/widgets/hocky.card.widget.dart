import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/bangdiemhocky.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

Widget HocKyCard(BangDiemHocKy item) {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 15.0,
            color: AppColors.blackShadow,
            offset: const Offset(
              0.0,
              15.0,
            ),
            spreadRadius: 13.0,
          ),
        ]),
    child: ListTile(
      title: (Text(
        item.hocky,
        style: CustomTextWidget.bodyTextS14Cblue(),
      )),
      subtitle: Column(
        children: [
          vSizedBox1,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                      text: "TBC hệ 10: ",
                      style: CustomTextWidget.bodyTextS14W6(),
                      children: <TextSpan>[
                    TextSpan(
                        text: item.tbche10,
                        style: CustomTextWidget.bodyTextS14Cblue())
                  ])),
              RichText(
                  text: TextSpan(
                      text: "TBC hệ 4: ",
                      style: CustomTextWidget.bodyTextS14W6(),
                      children: <TextSpan>[
                    TextSpan(
                        text: item.tbche4,
                        style: CustomTextWidget.bodyTextS14Cblue())
                  ]))
            ],
          ),
          vSizedBox1,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Xếp loại học tập: ",
                      style: CustomTextWidget.bodyTextS14W6(),
                      children: <TextSpan>[
                    TextSpan(
                        text: item.xeploaihoctap,
                        style: CustomTextWidget.bodyTextS14CGreen())
                  ])),
              RichText(
                  text: TextSpan(
                      text: "Xếp loại hạnh kiểm: ",
                      style: CustomTextWidget.bodyTextS14W6(),
                      children: <TextSpan>[
                    TextSpan(
                        text: item.xeploaihanhkiem,
                        style: CustomTextWidget.bodyTextS14CGreen())
                  ]))
            ],
          ),
          vSizedBox1,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Điểm rèn luyện: ",
                      style: CustomTextWidget.bodyTextS14W6(),
                      children: <TextSpan>[
                    TextSpan(
                        text: item.diemrenluyen,
                        style: CustomTextWidget.bodyTextS14Cblue())
                  ])),
              RichText(
                  text: TextSpan(
                      text: "Cảnh báo học lực: ",
                      style: CustomTextWidget.bodyTextS14W6(),
                      children: <TextSpan>[
                    TextSpan(
                        text: item.canhbaohocluc,
                        style: item.canhbaohocluc.toLowerCase() == 'có'
                            ? CustomTextWidget.bodyTextS14W6red()
                            : CustomTextWidget.bodyTextS14W6())
                  ]))
            ],
          ),
          vSizedBox1,
          dividerH2B,
        ],
      ),
    ),
  );
}
