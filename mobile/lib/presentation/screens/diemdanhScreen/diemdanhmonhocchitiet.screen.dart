import 'package:flutter/material.dart';
import 'package:mobile/core/models/classsubject.dart';
import 'package:mobile/core/models/subjectcheckinglist.dart';
import 'package:mobile/core/notifiers/diemdanh.notifier.dart';
import 'package:mobile/presentation/screens/diemdanhScreen/widgets/diemdanhmonhocchitiet.widget.dart';
import 'package:mobile/presentation/widgets/custom.appbar.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class DiemDanhMonHocChiTietScreen extends StatelessWidget {
  const DiemDanhMonHocChiTietScreen({super.key, required this.diemdanh});
  final ClassSubject diemdanh;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: CustomAppbar(diemdanh.subjectName!, context),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Lớp học phần"),
                    Text(
                      diemdanh.classSubjectID.toString(),
                      style: CustomTextWidget.bodyTextS14B(),
                    )
                  ],
                ),
                vSizedBox1,
                dividerH2B1w2,
                vSizedBox1,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tín chỉ"),
                    Text(
                      diemdanh.unitText.toString(),
                      style: CustomTextWidget.bodyTextS14B(),
                    )
                  ],
                ),
                vSizedBox1,
                dividerH2B1w2,
                vSizedBox1,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tổng giờ vắng"),
                    Text(
                      diemdanh.offQuantityTotal.toString(),
                      style: CustomTextWidget.bodyTextS14W6red(),
                    )
                  ],
                ),
                vSizedBox1,
                dividerH2B1w2,
                vSizedBox1,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Số giờ"),
                    Text(
                      diemdanh.totalQuantity.toString(),
                      style: CustomTextWidget.bodyTextS14B(),
                    )
                  ],
                ),
                vSizedBox1,
                dividerH2B1w2,
                vSizedBox1,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Cấm thi"),
                    Text(
                      diemdanh.allowExamDescription!,
                      style: diemdanh.allowExamDescription! == "Cấm thi"
                          ? CustomTextWidget.bodyTextS14W6red()
                          : CustomTextWidget.bodyTextS14(),
                    )
                  ],
                ),
                vSizedBox1,
                dividerH2B1w2,
                vSizedBox1,
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10.0),
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Text("Chi tiết",
                      style:
                          CustomTextWidget.bodyTextB3(color: Colors.black87)),
                ),
                Expanded(
                  child: Consumer<DiemDanhNotifier>(
                      builder: (context, bangdiem, _) {
                    return FutureBuilder(
                        future: bangdiem.subjectCheckingList(
                            context: context,
                            classSubjectID: diemdanh.classSubjectID!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CustomLoading.Loading(context: context);
                          } else if (!snapshot.hasData) {
                            return CustomDataEntyWidget.KhongCoDuLieu();
                          } else {
                            var data =
                                snapshot.data as List<SubjectCheckingList>;
                            return ListView.builder(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5, bottom: 5),
                                // ignore: unnecessary_null_comparison
                                itemCount: data == null ? 0 : data.length,
                                itemBuilder: (context, index) =>
                                    diemDanhMonHocChiTietWidgetNew(
                                        item: data[index])
                                //DiemDanhMonHocWidget(item: data[index], context: context),
                                );
                          }
                        });
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
