import 'package:flutter/material.dart';
import 'package:mobile/core/models/diemhocphan.dart';
import 'package:mobile/core/models/objresult.dart';
import 'package:mobile/core/models/subjectmarkdetail.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

// ignore: non_constant_identifier_names
Widget MonHoc(DiemHocPhan item, BuildContext context) {
  return ExpansionTile(
    collapsedBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    title: Table(
      columnWidths: <int, TableColumnWidth>{
        0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.2),
        1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.5),
        2: FlexColumnWidth(MediaQuery.of(context).size.width * 0.1),
        3: FlexColumnWidth(MediaQuery.of(context).size.width * 0.2),
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
        padding: const EdgeInsets.all(10.0),
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

Widget MonHocNew({required SubjectMark item, required BuildContext context}) {
  return ExpansionTile(
    collapsedBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    title: Table(
      columnWidths: <int, TableColumnWidth>{
        0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.2),
        1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.5),
        2: FlexColumnWidth(MediaQuery.of(context).size.width * 0.1),
        3: FlexColumnWidth(MediaQuery.of(context).size.width * 0.2)
      },
      children: [
        TableRow(
          children: <Widget>[
            Text(item.subjectID),
            Text(
              item.subjectName,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            Text(
              item.unitText.toString(),
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            Text(
              item.finalSummary.toString(),
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            //Text(item.tc),
          ],
        )
      ],
    ),
    children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            children: getItem(
          items: item.fields,
          context: context,
        )),
      ),
    ],
  );
}

List<Widget> getItem(
    {required List<ObjResult> items, required BuildContext context}) {
  List<Widget> lists = [];
  int length = items.length ~/ 3;
  int phanDu = items.length % 3;
  int index = 0;
  if (length > 0) {
    List<TableRow> tableRows = [];
    for (int i = 0; i < length; i++) {
      tableRows.add(TableRow(children: [
        RichText(
            text: TextSpan(
                text: "${items[index].fieldCaption}: ",
                style: CustomTextWidget.captionStyle(items[index].captionStyle),
                children: <TextSpan>[
              TextSpan(
                  text: items[index].fieldValue,
                  style: CustomTextWidget.valueStyle(items[index].valueStyle))
            ])),
        RichText(
            text: TextSpan(
                text: "${items[index + 1].fieldCaption}: ",
                style: CustomTextWidget.captionStyle(
                    items[index + 1].captionStyle),
                children: <TextSpan>[
              TextSpan(
                  text: items[index + 1].fieldValue,
                  style:
                      CustomTextWidget.valueStyle(items[index + 1].valueStyle))
            ])),
        RichText(
            text: TextSpan(
                text: "${items[index + 2].fieldCaption}: ",
                style: CustomTextWidget.captionStyle(
                    items[index + 2].captionStyle),
                children: <TextSpan>[
              TextSpan(
                  text: items[index + 2].fieldValue,
                  style:
                      CustomTextWidget.valueStyle(items[index + 2].valueStyle))
            ])),
      ]));
      tableRows
          .add(const TableRow(children: [vSizedBox1, vSizedBox1, vSizedBox1]));
      index = index + 3;
    }
    if (phanDu > 0) {
      List<Widget> subWidget = [];
      for (int i = 0; i < phanDu; i++) {
        subWidget.add(
          RichText(
              text: TextSpan(
                  text: "${items[index + i].fieldCaption}: ",
                  style: CustomTextWidget.captionStyle(
                      items[index + i].captionStyle),
                  children: <TextSpan>[
                TextSpan(
                    text: items[index + i].fieldValue,
                    style: CustomTextWidget.valueStyle(
                        items[index + i].valueStyle))
              ])),
        );
        index + 1;
      }
      // ignore: unused_local_variable

      Map<int, TableColumnWidth> columnWidths = {};
      // double sizeWidth = 0.9 / phanDu;
      switch (phanDu) {
        case 1:
          columnWidths.addAll(
            {0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3)},
          );
          columnWidths.addAll(
            {1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3)},
          );
          columnWidths.addAll(
            {1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3)},
          );
          subWidget.add(vSizedBox1);
          subWidget.add(vSizedBox1);
          break;
        case 2:
          columnWidths.addAll(
              {0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3)});
          columnWidths.addAll(
              {1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3)});
          columnWidths.addAll(
              {2: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3)});
          subWidget.add(vSizedBox1);
          break;
      }
      tableRows.add(TableRow(children: subWidget));
    }
    lists.add(
      Table(
        columnWidths: <int, TableColumnWidth>{
          0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3),
          1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3),
          2: FlexColumnWidth(MediaQuery.of(context).size.width * 0.3),
        },
        children: tableRows,
      ),
    );
  }

  return lists;
}
