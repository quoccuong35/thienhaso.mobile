import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/studentinfo.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

// ignore: non_constant_identifier_names
Widget HoSoWidget({required StudentInfo user}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2.0),
    padding: const EdgeInsets.all(10.0),
    color: AppColors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hồ sơ",
          style: CustomTextWidget.bodyTextB3(color: Colors.black87),
        ),
        vSizedBox1,
        Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Mã sinh viên"),
                    Text(
                      user.studentCode!,
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
                    const Text("Giới tính"),
                    Text(
                      'N/A',
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
                    const Text("Ngày sinh"),
                    Text(
                      user.birthDateText!,
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
                    const Text("Nơi sinh"),
                    Text(
                      user.birthPlace!,
                      style: CustomTextWidget.bodyTextS14B(),
                    )
                  ],
                ),
                vSizedBox1,
                dividerH2B1w2,
                vSizedBox1,
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Text("Nguyên quán"),
                //     Text(
                //       user.birthPlace!,
                //       style: CustomTextWidget.bodyTextS14B(),
                //     )
                //   ],
                // ),
                // vSizedBox1,
                // dividerH2B1w2,
                // vSizedBox1,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Lớp"),
                    Text(
                      user.className!,
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
                    const Text("Số điện thoại"),
                    Text(
                      user.tel!,
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
                    const Text("Đt liên lạc (của phụ huynh)"),
                    Text(
                      user.contactTel!,
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
                    const Text("Email"),
                    Text(
                      user.email!,
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
                    const Text("Niên khóa"),
                    Text(
                      user.courseName!,
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
                      user.specialBranchName!,
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
                    const Text("Trạng thái"),
                    Text(
                      '',
                      style: CustomTextWidget.bodyTextS14B(),
                    )
                  ],
                ),
              ],
            ))
      ],
    ),
  );
}
