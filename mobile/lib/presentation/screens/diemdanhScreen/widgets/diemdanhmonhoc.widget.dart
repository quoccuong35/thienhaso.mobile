import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/classsubject.dart';

import 'package:mobile/presentation/screens/diemdanhScreen/diemdanhmonhocchitiet.screen.dart';

import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

// ignore: non_constant_identifier_names

Widget diemDanhMonHocWidget(
    {required ClassSubject item, required BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiemDanhMonHocChiTietScreen(diemdanh: item),
        ),
      );
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.95,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 15.0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 5.0,
      ),
      constraints: const BoxConstraints(
        minHeight: 140.0,
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
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: AppColors.blueGrey,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Icon(
                  item.allowExamDescription == "Cấm thi"
                      ? Icons.highlight_remove_outlined
                      : Icons.check_circle,
                  color: item.allowExamDescription == "Cấm thi"
                      ? Colors.red
                      : Colors.green,
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
                      item.subjectName!,
                      style: CustomTextWidget.bodyTextS18Cblue(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          item.subjectID.toString(),
                          style: CustomTextWidget.bodyTextS14B(),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: AppColors.bluedark,
                            ),
                            Text(
                              item.teacherName.toString(),
                              style: CustomTextWidget.bodyTextS14B(),
                            )
                          ],
                        )
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Năm học: ",
                          style: CustomTextWidget.bodyTextS14B()),
                      TextSpan(
                          text: item.yearID!.toString(),
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
                          text: item.semester!.toString(),
                          style: CustomTextWidget.bodyTextS14())
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "TC: ", style: CustomTextWidget.bodyTextS14B()),
                      TextSpan(
                          text: item.unitText!.toString(),
                          style: CustomTextWidget.bodyTextS14())
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
