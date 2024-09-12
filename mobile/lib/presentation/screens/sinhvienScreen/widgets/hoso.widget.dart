import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/sinhvien.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

Widget HoSoWidget({required SinhVien user}) {
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
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Mã sinh viên"),
                    Text(
                      user.masv,
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
                      user.gioitinh,
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
                      user.ngaysinh,
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
                      user.noisinh,
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
                    const Text("Nguyên quán"),
                    Text(
                      user.nguyenquan,
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
                    const Text("Lớp"),
                    Text(
                      user.lop,
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
                      user.sodienthoai,
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
                      user.email,
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
                      user.nienkhoa,
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
                      user.nganhnghe,
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
