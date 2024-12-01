import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/core/models/classsubject.dart';

textHeader() {
  return const TextStyle(
    fontFamily: AppFonts.lato,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.white,
  );
}

textCell() {
  return const TextStyle(
      fontFamily: AppFonts.lato, overflow: TextOverflow.clip);
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
        } else {
          return Colors.white;
        } // Use default value for other states and odd rows.
      }),
      cells: <DataCell>[
        DataCell(Text(
          items[i].subjectID!,
          style: textCell(),
        )),
        DataCell(
          SizedBox(
            width: 200.0,
            child: Text(
              items[i].subjectName!,
              style: textCell(),
            ),
          ),
        ),
        DataCell(Center(
          child: Text(
            items[i].unitText!.toString(),
            style: textCell(),
          ),
        )),
        DataCell(
          Center(
            child: Text(
              items[i].totalQuantity!.toString(),
              style: textCell(),
            ),
          ),
        ),
        DataCell(Center(
          child: Text(
            items[i].offQuantityTotal != null
                ? items[i].offQuantityTotal!.toString()
                : "",
            style: textCell(),
          ),
        )),
      ],
    ));
  }
  return DataTable(
      columnSpacing: 10,
      horizontalMargin: 5,
      border: TableBorder.all(
        width: 2.0,
        color: Colors.black12,
      ),
      headingRowColor:
          WidgetStateColor.resolveWith((states) => AppColors.primary),
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            "Mã môn",
            style: textHeader(),
          ),
        ),
        DataColumn(
          label: Text(
            "Tên môn",
            style: textHeader(),
          ),
        ),
        DataColumn(
          label: Center(
            child: Text(
              "TC",
              style: textHeader(),
            ),
          ),
        ),
        DataColumn(
          label: Center(
            child: Text(
              "S.Giờ",
              style: textHeader(),
            ),
          ),
        ),
        DataColumn(
          label: Center(
            child: Text(
              "T.Vắng",
              style: textHeader(),
            ),
          ),
        )
      ],
      rows: rows);
}
