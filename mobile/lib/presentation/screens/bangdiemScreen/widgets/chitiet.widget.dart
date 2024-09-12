import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/diemhocphan.dart';
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
          future: bangdiem.bangDiemChiTiet(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLoading.Loading(context: context);
            } else if (!snapshot.hasData) {
              return CustomDataEntyWidget.KhongCoDuLieu();
            } else {
              var data = snapshot.data as List<DiemChiTiet>;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item1 = data[index];
                    final dienhocphan = item1.diemhocphams;
                    return Container(
                      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: ExpansionTile(
                        backgroundColor: const Color.fromRGBO(230, 240, 255, 1),
                        collapsedBackgroundColor:
                            const Color.fromRGBO(230, 240, 255, 1),
                        title: Text(
                          item1.hocky,
                          style: TextStyle(color: AppColors.primary),
                        ),
                        subtitle: Table(
                          columnWidths: <int, TableColumnWidth>{
                            0: FlexColumnWidth(swidth * 0.3),
                            1: FlexColumnWidth(swidth * 0.5),
                            2: FlexColumnWidth(swidth * 0.1),
                            3: FlexColumnWidth(swidth * 0.1),
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
                        children: dienhocphan.map((DiemHocPhan hocphan) {
                          return MonHoc(hocphan, context);
                        }).toList(),
                      ),
                    );
                  });
            }
          });
    });
  }
}
