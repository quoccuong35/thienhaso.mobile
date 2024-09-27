import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/diemdanhmonhoc.dart';
import 'package:mobile/presentation/screens/diemdanhScreen/diemdanhmonhocchitiet.screen.dart';

import 'package:mobile/presentation/widgets/custom.text.style.dart';

// ignore: non_constant_identifier_names
Widget DiemDanhMonHocWidget(
    {required DiemDanhMonHoc item, required BuildContext context}) {
  return Card(
    elevation: 8,
    margin: const EdgeInsets.all(5.0),
    child: ListTile(
      trailing: Icon(
        Icons.arrow_circle_right_outlined,
        size: 25.0,
        color: AppColors.primary,
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
              overflow: TextOverflow.clip,
              text: TextSpan(
                  text: "GV: ",
                  style: CustomTextWidget.bodyTextS14(),
                  children: <TextSpan>[
                    TextSpan(
                        text: item.giaovien,
                        style: CustomTextWidget.bodyTextS14())
                  ])),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(
                  text: "Số giờ: ",
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                TextSpan(
                    text: item.sogio,
                    style: CustomTextWidget.bodyTextS14Cblue())
              ])),
          RichText(
              text: TextSpan(
                  text: "Tín chỉ: ",
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                TextSpan(
                    text: item.tc, style: CustomTextWidget.bodyTextS14Cblue())
              ])),
        ],
      ),
    ),
  );
}
