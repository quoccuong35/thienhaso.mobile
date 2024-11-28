import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/classsubject.dart';

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
          backgroundColor: AppColors.creamColor,
          appBar: CustomAppbar("Điểm danh", context),
          body: Consumer<DiemDanhNotifier>(builder: (context, diemdanh, _) {
            return FutureBuilder(
                future: diemdanh.classSubjectList(context: context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomLoading.Loading(context: context);
                  } else if (!snapshot.hasData) {
                    return CustomDataEntyWidget.KhongCoDuLieu();
                  } else {
                    var data = snapshot.data as List<ClassSubject>;
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
                          padding: const EdgeInsets.all(5.0),
                          itemCount: data.length,
                          itemBuilder: (context, index) => diemDanhMonHocWidget(
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
