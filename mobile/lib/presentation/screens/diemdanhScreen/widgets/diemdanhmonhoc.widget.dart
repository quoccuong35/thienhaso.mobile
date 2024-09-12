import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/diemdanhmonhoc.dart';
import 'package:mobile/presentation/screens/diemdanhScreen/diemdanhmonhocchitiet.screen.dart';

import 'package:mobile/presentation/widgets/custom.text.style.dart';

Widget DiemDanhMonHocWidget(
    {required DiemDanhMonHoc item, required BuildContext context}) {
  return Container(
    margin: EdgeInsets.only(right: 10, bottom: 10),
    decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: AppColors.blackShadow,
            offset: Offset(
              0,
              15,
            ),
            spreadRadius: 13,
          ),
        ]),
    child: ListTile(
      trailing: const Icon(
        Icons.arrow_circle_right_outlined,
        size: 25.0,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiemDanhMonHocChiTietScreen(diemdanh: item),
          ),
        );
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.malophocphan,
            style: CustomTextWidget.bodyTextS14B(),
          ),
          Text(
            item.tenlophocphan,
            style: CustomTextWidget.bodyTextS14B(),
          ),
          RichText(
              text: TextSpan(
                  text: "GV: ",
                  style: CustomTextWidget.bodyTextS14W6(),
                  children: <TextSpan>[
                TextSpan(
                    text: item.giaovien,
                    style: CustomTextWidget.bodyTextS14W6())
              ])),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(
                  text: "Số giờ: ",
                  style: CustomTextWidget.bodyTextS14W6(),
                  children: <TextSpan>[
                TextSpan(
                    text: item.sogio,
                    style: CustomTextWidget.bodyTextS14Cblue())
              ])),
          RichText(
              text: TextSpan(
                  text: "Tín chỉ: ",
                  style: CustomTextWidget.bodyTextS14W6(),
                  children: <TextSpan>[
                TextSpan(
                    text: item.tc, style: CustomTextWidget.bodyTextS14Cblue())
              ])),
        ],
      ),
    ),
  );
}
