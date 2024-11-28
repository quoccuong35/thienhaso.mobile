import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/core/models/classsubject.dart';

textHeader() {
  return const TextStyle(
    fontFamily: AppFonts.lato,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Colors.black,
  );
}

textCell() {
  return const TextStyle(
      fontFamily: AppFonts.lato, fontSize: 12, overflow: TextOverflow.clip);
}

// ignore: non_constant_identifier_names
Widget DiemTongHopWidget(
    {required List<ClassSubject> items, required double swidth}) {
  List<DataRow> rows = [];
  for (int i = 0; i < items.length; i++) {
    rows.add(DataRow(
      color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (i.isOdd) {
          return Colors.grey.withOpacity(0.3);
        }
        return null; // Use default value for other states and odd rows.
      }),
      cells: <DataCell>[
        DataCell(SizedBox(
          width: swidth * 0.2,
          child: Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              items[i].subjectID!,
              style: textCell(),
            ),
          ),
        )),
        DataCell(SizedBox(
            width: swidth * 0.4,
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                items[i].subjectName!,
                style: textCell(),
              ),
            ))),
        DataCell(SizedBox(
          width: swidth * 0.08,
          child: Center(
            child: Text(
              items[i].unitText!.toString(),
              style: textCell(),
            ),
          ),
        )),
        DataCell(SizedBox(
          width: swidth * 0.1,
          child: Center(
            child: Text(
              items[i].totalQuantity!.toString(),
              style: textCell(),
            ),
          ),
        )),
        DataCell(SizedBox(
          width: swidth * 0.2,
          child: Center(
            child: Text(
              items[i].offQuantityTotal != null
                  ? items[i].offQuantityTotal!.toString()
                  : "",
              style: textCell(),
            ),
          ),
        )),
      ],
    ));
  }
  return DataTable(
      columnSpacing: 10,
      horizontalMargin: 0,
      border: TableBorder.all(
        width: 2.0,
        color: Colors.black12,
      ),
      headingRowColor: WidgetStateColor.resolveWith((states) => Colors.black26),
      columns: <DataColumn>[
        DataColumn(
          label: SizedBox(
            width: swidth * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "Mã môn",
                style: textHeader(),
              ),
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
              width: swidth * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  "Tên môn",
                  style: textHeader(),
                ),
              )),
        ),
        DataColumn(
          label: SizedBox(
            width: swidth * 0.08,
            child: Center(
              child: Text(
                "TC",
                style: textHeader(),
              ),
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: swidth * 0.1,
            child: Center(
              child: Text(
                "S.Giờ",
                style: textHeader(),
              ),
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: swidth * 0.2,
            child: Center(
              child: Text(
                "T.Vắng",
                style: textHeader(),
              ),
            ),
          ),
        )
      ],
      rows: rows);
}
