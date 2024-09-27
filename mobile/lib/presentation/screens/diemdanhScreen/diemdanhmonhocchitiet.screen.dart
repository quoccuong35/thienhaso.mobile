import 'package:flutter/material.dart';
import 'package:mobile/core/models/diemdanhmonhoc.dart';
import 'package:mobile/presentation/screens/diemdanhScreen/widgets/diemdanhmonhocchitiet.widget.dart';
import 'package:mobile/presentation/widgets/custom.appbar.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

class DiemDanhMonHocChiTietScreen extends StatelessWidget {
  const DiemDanhMonHocChiTietScreen({super.key, required this.diemdanh});
  final DiemDanhMonHoc diemdanh;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: CustomAppbar(diemdanh.tenlophocphan, context),
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
                      diemdanh.malophocphan,
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
                      diemdanh.tc,
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
                      diemdanh.tonggiovang,
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
                      diemdanh.sogio,
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
                      diemdanh.camthi,
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
                    const Text("Ghi chú"),
                    Text(
                      diemdanh.ghichu,
                      style: CustomTextWidget.bodyTextS14W6red(),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10.0),
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Text("Chi tiết",
                      style:
                          CustomTextWidget.bodyTextB3(color: Colors.black87)),
                ),
                Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, bottom: 15),
                        itemCount: diemdanh.diemdanhchitiet == null
                            ? 0
                            : diemdanh.diemdanhchitiet?.length,
                        itemBuilder: (context, index) =>
                            DiemDanhMonHocChiTietWidget(
                                item: diemdanh.diemdanhchitiet![index])
                        //DiemDanhMonHocWidget(item: data[index], context: context),
                        )),
              ],
            ),
          ),
        ));
  }
}
