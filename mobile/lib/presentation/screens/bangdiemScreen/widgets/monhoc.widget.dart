import 'package:flutter/material.dart';
import 'package:mobile/core/models/diemhocphan.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

Widget MonHoc(DiemHocPhan item, BuildContext context) {
  return ExpansionTile(
    collapsedBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    title: Table(
      columnWidths: <int, TableColumnWidth>{
        0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3),
        1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.5),
        2: FlexColumnWidth(MediaQuery.of(context).size.width * 0.1),
        3: FlexColumnWidth(MediaQuery.of(context).size.width * 0.1),
      },
      children: [
        TableRow(
          children: <Widget>[
            Text(item.mamon),
            Text(
              item.tenmon,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            Text(item.tc),
            Text(item.d10),
          ],
        )
      ],
    ),
    children: [
      Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Table(
              columnWidths: <int, TableColumnWidth>{
                0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3),
                1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3),
                2: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3),
              },
              children: [
                TableRow(children: [
                  RichText(
                      text: TextSpan(
                          text: "HS1: ",
                          style: CustomTextWidget.bodyTextS14W6(),
                          children: <TextSpan>[
                        TextSpan(
                            text: item.hs1,
                            style: CustomTextWidget.bodyTextS14B())
                      ])),
                  RichText(
                      text: TextSpan(
                          text: "HS2: ",
                          style: CustomTextWidget.bodyTextS14W6(),
                          children: <TextSpan>[
                        TextSpan(
                            text: item.hs2,
                            style: CustomTextWidget.bodyTextS14B())
                      ])),
                  RichText(
                      text: TextSpan(
                          text: "TBKT: ",
                          style: CustomTextWidget.bodyTextS14W6(),
                          children: <TextSpan>[
                        TextSpan(
                            text: item.tbkt,
                            style: CustomTextWidget.bodyTextS14B())
                      ]))
                ]),
                const TableRow(children: [vSizedBox1, vSizedBox1, vSizedBox1]),
                TableRow(
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            text: "Thi lần 1: ",
                            style: CustomTextWidget.bodyTextS14W6(),
                            children: <TextSpan>[
                          TextSpan(
                              text: item.thi1,
                              style: CustomTextWidget.bodyTextS14B())
                        ])),
                    RichText(
                        text: TextSpan(
                            text: "Thi lần 2: ",
                            style: CustomTextWidget.bodyTextS14W6(),
                            children: <TextSpan>[
                          TextSpan(
                              text: item.thi2,
                              style: CustomTextWidget.bodyTextS14B())
                        ])),
                    RichText(
                        text: TextSpan(
                            text: "Thi lần 3: ",
                            style: CustomTextWidget.bodyTextS14W6(),
                            children: <TextSpan>[
                          TextSpan(
                              text: item.thi3,
                              style: CustomTextWidget.bodyTextS14B())
                        ]))
                  ],
                ),
              ],
            ),
            vSizedBox1,
            Table(
              columnWidths: <int, TableColumnWidth>{
                0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.6),
                1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3),
              },
              children: [
                TableRow(children: [
                  RichText(
                      text: TextSpan(
                          text: "Tổng kết môn(điểm 04): ",
                          style: CustomTextWidget.bodyTextS14W6(),
                          children: <TextSpan>[
                        TextSpan(
                            text: item.tongketmon,
                            style: CustomTextWidget.bodyTextS14B())
                      ])),
                  RichText(
                      text: TextSpan(
                          text: "Điểm chữ: ",
                          style: CustomTextWidget.bodyTextS14W6(),
                          children: <TextSpan>[
                        TextSpan(
                            text: item.diemchu,
                            style: CustomTextWidget.bodyTextS14B())
                      ]))
                ])
              ],
            )
          ],
        ),
      ),
    ],
  );
}
