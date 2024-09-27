import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/subjectmarkdetail.dart';
import 'package:mobile/core/notifiers/bangdiem.notifier.dart';
import 'package:mobile/presentation/screens/bangdiemScreen/widgets/monhoc.widget.dart';
import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class ChiTiet extends StatelessWidget {
  const ChiTiet({super.key});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return Consumer<BangDiemNotifier>(builder: (context, bangdiem, _) {
      return FutureBuilder(
          future: bangdiem.getSubjectMarkDetail(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLoading.Loading(context: context);
            } else if (!snapshot.hasData) {
              return CustomDataEntyWidget.KhongCoDuLieu();
            } else {
              var data = snapshot.data as List<SubjectMarkDetail>;
              return hocky(data: data, context: context, swidth: swidth);
            }
          });
    });
  }

  Widget hocky(
      {required List<SubjectMarkDetail> data,
      required double swidth,
      required BuildContext context}) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item1 = data[index];
          final subjectMarks = item1.subjectMarks;
          return Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: ExpansionTile(
              backgroundColor: AppColors.color1,
              collapsedBackgroundColor: AppColors.color1,
              title: Text(
                "Học kỳ ${item1.semester}-${item1.yearID}",
                style: TextStyle(color: AppColors.primary),
              ),
              subtitle: Table(
                columnWidths: <int, TableColumnWidth>{
                  0: FlexColumnWidth(swidth * 0.2),
                  1: FlexColumnWidth(swidth * 0.5),
                  2: FlexColumnWidth(swidth * 0.1),
                  3: FlexColumnWidth(swidth * 0.2),
                },
                children: const [
                  TableRow(
                    children: <Widget>[
                      Text("Mã môn"),
                      Text("Tên môn"),
                      Text("TC"),
                      Text("Đ10"),
                    ],
                  )
                ],
              ),
              children: subjectMarks.map((SubjectMark subjectMark) {
                return MonHocNew(context: context, item: subjectMark);
              }).toList(),
            ),
          );
        });
  }
}
