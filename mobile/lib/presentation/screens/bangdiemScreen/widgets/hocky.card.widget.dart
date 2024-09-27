import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/objresult.dart';
import 'package:mobile/core/models/subjectmarkofsemester.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

Widget hocKyCard(SubjectMarkOfSemester item) {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 15.0,
            color: AppColors.blackShadow,
            offset: Offset(
              0.0,
              15.0,
            ),
            spreadRadius: 13.0,
          ),
        ]),
    child: ListTile(
      title: (Text(
        "Học kỳ ${item.semester}-${item.yearID}",
        style: CustomTextWidget.bodyTextS14Cblue(),
      )),
      subtitle: Column(children: getItem(items: item.fields)),
    ),
  );
}

List<Widget> getItem({required List<ObjResult> items}) {
  List<Widget> lists = [];
  int length = items.length ~/ 2;
  int phanDu = items.length % 2;
  int index = 0;
  if (length > 0) {
    for (int i = 0; i < length; i++) {
      lists.add(vSizedBox1);
      lists.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(
                  text: "${items[index].fieldCaption}: ",
                  style:
                      CustomTextWidget.captionStyle(items[index].captionStyle),
                  children: <TextSpan>[
                TextSpan(
                  text: items[index].fieldValue,
                  style: CustomTextWidget.valueStyle(items[index].valueStyle),
                )
              ])),
          RichText(
            text: TextSpan(
              text: "${items[index + 1].fieldCaption}: ",
              style:
                  CustomTextWidget.captionStyle(items[index + 1].captionStyle),
              children: <TextSpan>[
                TextSpan(
                  text: items[index + 1].fieldValue,
                  style:
                      CustomTextWidget.valueStyle(items[index + 1].valueStyle),
                )
              ],
            ),
          ),
        ],
      ));
      index = index + 2;
    }
  }

  if (phanDu == 1) {
    lists.add(vSizedBox1);
    lists.add(Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                text: items.last.fieldCaption,
                style: CustomTextWidget.bodyTextS14(),
                children: <TextSpan>[
              TextSpan(
                  text: items.last.fieldValue,
                  style: CustomTextWidget.bodyTextS14W6())
            ])),
      ],
    ));
  }
  lists.add(vSizedBox1);
  lists.add(dividerH2B);
  return lists;
}
