import 'package:flutter/material.dart';
import 'package:mobile/core/models/bangdiemtoankhoa.dart';
import 'package:mobile/core/notifiers/bangdiem.notifier.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class ToanKhoa extends StatelessWidget {
  const ToanKhoa({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BangDiemNotifier>(builder: (context, bangdiem, _) {
      return FutureBuilder(
          future: bangdiem.bangDiemToanKhoa(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLoading.Loading(context: context);
            } else if (!snapshot.hasData) {
              return CustomDataEntyWidget.KhongCoDuLieu();
            } else {
              var data = snapshot.data as BangDiemToanKhoa;
              return ListView(
                padding: EdgeInsets.all(5),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Niên khóa"),
                      Text(
                        data.nienkhoa,
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
                      const Text("Lớp học"),
                      Text(
                        data.lophoc,
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
                      const Text("Ngành/nghề"),
                      Text(
                        data.nganhnghe,
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
                      const Text("Trình độ đào tạo"),
                      Text(
                        data.trinhdodaotao,
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
                      const Text("Tổng số tín chỉ"),
                      Text(
                        data.tongsotc,
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
                      const Text("Tổng số tín chỉ tích lũy"),
                      Text(
                        data.tongsotctichluy,
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
                      const Text("Xếp loại học tập"),
                      Text(
                        data.xeploaihoctap,
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
                      const Text("TBCTL hệ 10"),
                      Text(
                        data.tbctlhe10,
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
                      const Text("TBCTL hệ 4"),
                      Text(
                        data.tbctlhe4,
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
                      const Text("Xếp loại học tập"),
                      Text(
                        data.xeploaihoctap,
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
                      const Text("TBCTN hệ 10"),
                      Text(
                        data.tbctnhe10,
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
                      const Text("TBCTN hệ 4"),
                      Text(
                        data.tbctnhe4,
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
                      const Text("Xếp loại tốt nghiệp"),
                      Text(
                        data.xeploaitotnghiep,
                        style: CustomTextWidget.bodyTextS14B(),
                      )
                    ],
                  )
                ],
              );
            }
          });
    });
  }
}
