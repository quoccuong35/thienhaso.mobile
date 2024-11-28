import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';

import 'package:mobile/core/models/subjectcheckinglist.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

Widget diemDanhMonHocChiTietWidgetNew({required SubjectCheckingList item}) {
  return Card(
    elevation: 8.0,
    child: ListTile(
      title: Row(
        children: [
          Icon(
            Icons.calendar_month,
            color: AppColors.bluedark,
          ),
          Text(
            item.date.toString(),
            style: CustomTextWidget.bodyTextS16W6(),
          ),
        ],
      ),
      subtitle: Container(
          decoration: BoxDecoration(
            color: AppColors.blueGrey,
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          constraints: const BoxConstraints(
            minHeight: 50.0,
          ),
          padding: const EdgeInsets.all(
            10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Có phép: ",
                            style: CustomTextWidget.bodyTextS14W6()),
                        TextSpan(
                            text: item.permissionQuantity.toString(),
                            style: CustomTextWidget.bodyTextS14Cblue())
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Không phép: ",
                            style: CustomTextWidget.bodyTextS14W6()),
                        TextSpan(
                            text: item.noPermissionQuantity.toString(),
                            style: CustomTextWidget.bodyTextS14W6red())
                      ],
                    ),
                  ),
                ],
              ),
              vSizedBox1,
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Mô tả: ",
                      style: CustomTextWidget.bodyTextS14B(),
                    ),
                    TextSpan(
                      text: item.description,
                      style: CustomTextWidget.bodyTextS14(),
                    )
                  ],
                ),
              ),
            ],
          )),
    ),
  );
}
