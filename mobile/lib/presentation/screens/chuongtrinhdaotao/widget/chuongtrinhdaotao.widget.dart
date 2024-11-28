import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';

// ignore: non_constant_identifier_names
Widget ChuongTrinhDaoTaoWidget({required dynamic data}) {
  return DataTable(
    columnSpacing: 10,
    horizontalMargin: 0,
    border: TableBorder.all(
      width: 2.0,
      color: Colors.black12,
    ),
    headingRowColor: WidgetStateColor.resolveWith((states) => Colors.black26),
    columns: const [
      DataColumn(label: Text('Mã MH')),
      DataColumn(label: Text('Tên Môn Học')),
      DataColumn(label: Text('Năm')),
      DataColumn(label: Text('HK')),
      DataColumn(label: Text('TC')),
      DataColumn(label: Text('LT')),
      DataColumn(label: Text('TH')),
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
