import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/constants/app.colors.dart';

import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

// ignore: non_constant_identifier_names

// ignore: non_constant_identifier_names
Widget CacKhoanThuCard({required dynamic item, required BuildContext context}) {
  var f = NumberFormat("###,###", "en_US");
  return Container(
    width: MediaQuery.of(context).size.width * 0.95,
    margin: const EdgeInsets.symmetric(
      vertical: 5.0,
      horizontal: 5.0,
    ),
    constraints: const BoxConstraints(
      minHeight: 120.0,
    ),
    decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 15.0,
            color: AppColors.blackShadow,
            offset: Offset(
              0,
              15.0,
            ),
            spreadRadius: 13.0,
          ),
        ]),
    child: Column(
      children: <Widget>[
        Row(
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: AppColors.blueGrey,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: Icon(
                Icons.monetization_on,
                color: item['RemainMoney'] > 0 ? Colors.red : Colors.green,
                size: 40,
              ),
            ),
            hSizedBox1,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['ReceiptSegmentName']!,
                    style: CustomTextWidget.bodyTextS14Cblue(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Năm: ",
                                style: CustomTextWidget.bodyTextS14B()),
                            TextSpan(
                                text: item['YearID']!.toString(),
                                style: CustomTextWidget.bodyTextS14())
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Học kỳ: ",
                                style: CustomTextWidget.bodyTextS14B()),
                            TextSpan(
                                text: item['Semester']!.toString(),
                                style: CustomTextWidget.bodyTextS14())
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        vSizedBox1,
        Container(
          decoration: BoxDecoration(
            color: AppColors.blueGrey,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          padding: const EdgeInsets.all(
            10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(" Phải nộp", style: CustomTextWidget.bodyTextS14B()),
                  Text(f.format(item['PlanMoney']!).toString()),
                ],
              ),
              Column(
                children: [
                  Text("Đã Nộp", style: CustomTextWidget.bodyTextS14B()),
                  Text(f.format(item['ReceiptMoney']!).toString()),
                ],
              ),
              Column(
                children: [
                  Text("Còn Lại", style: CustomTextWidget.bodyTextS14B()),
                  Text(
                    f.format(item['RemainMoney']!).toString(),
                    style: item['RemainMoney']! > 0
                        ? CustomTextWidget.bodyTextS14W6red()
                        : CustomTextWidget.bodyTextS14(),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
