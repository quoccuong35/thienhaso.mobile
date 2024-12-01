import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';

textCell() {
  return const TextStyle(
      fontFamily: AppFonts.lato,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.clip);
}

// ignore: non_constant_identifier_names
Widget ChuongTrinhDaoTaoWidget({required dynamic data}) {
  return DataTable(
    columnSpacing: 10,
    horizontalMargin: 5,
    border: TableBorder.all(
      width: 2.0,
      color: Colors.black12,
    ),
    headingRowColor:
        WidgetStateColor.resolveWith((states) => AppColors.primary),
    columns: [
      DataColumn(
          label: Text(
        'Mã MH',
        style: textCell(),
      )),
      DataColumn(
          label: Text(
        'Tên Môn Học',
        style: textCell(),
      )),
      DataColumn(
          label: Text(
        'Năm',
        style: textCell(),
      )),
      DataColumn(
          label: Text(
        'HK',
        style: textCell(),
      )),
      DataColumn(
          label: Text(
        'TC',
        style: textCell(),
      )),
      DataColumn(
          label: Text(
        'LT',
        style: textCell(),
      )),
      DataColumn(
          label: Text(
        'TH',
        style: textCell(),
      )),
    ],
    rows: List<DataRow>.generate(
      data == null ? 0 : data.length,
      (index) {
        return DataRow(
          color: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (index.isOdd) {
              return Colors.grey.withOpacity(0.3);
            }
            return null; // Use default value for other states and odd rows.
          }),
          cells: <DataCell>[
            DataCell(Text(data[index]['SubjectID'])),
            DataCell(
              SizedBox(
                width: 200.0,
                child: Text(
                  data[index]['SubjectName'],
                  style: CustomTextWidget.bodyTextS14(),
                ),
              ),
            ),
            DataCell(
              Center(child: Text(data[index]['Year'].toString())),
            ),
            DataCell(
              Center(child: Text(data[index]['Semester'].toString())),
            ),
            DataCell(
              Center(child: Text(data[index]['UnitText'].toString())),
            ),
            DataCell(
              Center(child: Text(data[index]['TheoryQuantity'].toString())),
            ),
            DataCell(
              Center(child: Text(data[index]['PracticeQuantity'].toString())),
            ),
          ],
        );
      },
    ),
  );
}
