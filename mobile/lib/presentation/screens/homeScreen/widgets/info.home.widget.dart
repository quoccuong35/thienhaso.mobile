import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/app/routers/app.routes.dart';
import 'package:mobile/core/models/sinhvien.dart';
import 'package:mobile/core/notifiers/sinhvien.notifier.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

Widget InfoHome(BuildContext context, GlobalKey scaffoldKey) {
  return Consumer<SinhVienNotifier>(builder: (context, sinhvien, _) {
    return FutureBuilder(
        future: sinhvien.SinhienInfor(context: context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CustomLoading.Loading(context: context);
          } else if (!snapshot.hasData) {
            return CustomDataEntyWidget.KhongCoDuLieu();
          } else {
            var data = snapshot.data as SinhVien;
            return Container(
              height: 70.0,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppKeys.bg), fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hSizedBox1,
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    backgroundImage: AssetImage(data.urlimg),
                  ),
                  hSizedBox1,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Xin chào",
                        style: TextStyle(
                            fontFamily: AppFonts.lato,
                            color: AppColors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        data.hoten,
                        style: CustomTextWidget.appBarStyle(),
                      )
                    ],
                  ),
                  hSizedBox3,
                  IconButton(
                    color: AppColors.white,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRouter.mainSinhVienScreen);
                    },
                    icon: const Icon(Icons.menu, size: 36),
                  ),
                ],
              ),
            );
          }
        });
  });
}
