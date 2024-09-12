import 'package:flutter/material.dart';
import 'package:mobile/core/models/diemdanhmonhoc.dart';

import 'package:mobile/core/notifiers/diemdanh.notifier.dart';
import 'package:mobile/presentation/screens/diemdanhScreen/widgets/diemdanhmonhoc.widget.dart';
import 'package:mobile/presentation/widgets/custom.appbar.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';

import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class DiemDanhMonHocScreen extends StatelessWidget {
  const DiemDanhMonHocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: CustomAppbar("Điểm danh", context),
          body: Consumer<DiemDanhNotifier>(builder: (context, bangdiem, _) {
            return FutureBuilder(
                future: bangdiem.diemDanhMonHoc(context: context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomLoading.Loading(context: context);
                  } else if (!snapshot.hasData) {
                    return CustomDataEntyWidget.KhongCoDuLieu();
                  } else {
                    var data = snapshot.data as List<DiemDanhMonHoc>;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10, left: 10.0),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text("Danh sách môn học",
                              style: CustomTextWidget.bodyTextB3(
                                  color: Colors.black87)),
                        ),
                        Expanded(
                            child: ListView.builder(
                          padding: const EdgeInsets.only(left: 15.0),
                          itemCount: data.length,
                          itemBuilder: (context, index) => DiemDanhMonHocWidget(
                              item: data[index], context: context),
                        )),
                      ],
                    );
                  }
                });
          }),
        ));
  }
}
