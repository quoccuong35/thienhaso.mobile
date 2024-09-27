import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/diemdanhmonhoc.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

// ignore: non_constant_identifier_names
Widget DiemDanhMonHocChiTietWidget({required DiemDanhChiTiet item}) {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.blackShadow,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 15,
            color: Color.fromARGB(5, 73, 73, 77),
            offset: Offset(
              0,
              15,
            ),
            spreadRadius: 13,
          ),
        ]),
    padding: const EdgeInsets.all(10.0),
    margin: const EdgeInsets.only(bottom: 15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Trạng thái",
              style: CustomTextWidget.bodyTextS14W6(),
            ),
            Text("Ngày vắng", style: CustomTextWidget.bodyTextS14W6()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Icon(
                item.trangthai == "1"
                    ? Icons.highlight_remove_outlined
                    : Icons.check_circle,
                size: 20,
                color: item.trangthai == "1" ? Colors.red : Colors.green,
              ),
              Text(
                item.trangthai == "1" ? "Không phép" : "Có phép",
                style: TextStyle(
                    color: item.trangthai == "1" ? Colors.red : Colors.black),
              )
            ]),
            Text(item.ngayvang, style: CustomTextWidget.bodyTextS14B()),
          ],
        ),
        vSizedBox1,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Tiết hiện hành", style: CustomTextWidget.bodyTextS14W6()),
            Text("Số tiết vắng", style: CustomTextWidget.bodyTextS14W6()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(item.tiethienhanh, style: CustomTextWidget.bodyTextS14B()),
            Align(
              alignment: Alignment.centerLeft,
              child:
                  Text(item.sotietvang, style: CustomTextWidget.bodyTextS14B()),
            )
          ],
        )
      ],
    ),
  );
}
