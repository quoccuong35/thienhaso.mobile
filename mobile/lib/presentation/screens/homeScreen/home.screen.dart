// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/app/routers/app.routes.dart';
import 'package:mobile/core/models/menu.dart';
import 'package:mobile/core/models/data/menus.dart';
import 'package:mobile/core/notifiers/sinhvien.notifier.dart';
import 'package:mobile/core/notifiers/theme.notifier.dart';
import 'package:mobile/presentation/screens/homeScreen/widgets/custom.item.button.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Menu> listMenu = Menus.items.toList();
    var listDacbiet = listMenu.where((it) {
      return it.datbiet == true;
    }).toList();
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    // ignore: duplicate_ignore
    // ignore: unused_local_variable
    final currentCount =
        ((MediaQuery.of(context).size.width - 20) / 100).toInt();
    print(currentCount);
    const minCount = 3;
    SinhVienNotifier svNotifier = Provider.of<SinhVienNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    showDiemDanh(String routername) {
      if (routername == "/diemDanh") {
        showDialog<void>(
          context: context,
          barrierDismissible: true, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Icon(
                Icons.check_circle,
                color: AppColors.primary,
                size: 36.0,
              ),
              content: const SizedBox(
                height: 20.0,
                child: Center(
                  child: Text(
                    "Tùy chọn xem điểm danh",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              actions: <Widget>[
                MaterialButton(
                  color: AppColors.primary.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('Tổng hợp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppFonts.fontSize14,
                        fontWeight: FontWeight.w600,
                      )),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(AppRouter.diemDanhTongHop);
                  },
                ),
                MaterialButton(
                  color: AppColors.bluedark.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('Môn học',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppFonts.fontSize14,
                        fontWeight: FontWeight.w600,
                      )),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(AppRouter.diemDanhMonHoc);
                  },
                ),
              ],
            );
          },
        );
      } else {
        Navigator.of(context).pushNamed(routername);
      }
    }

    return Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundColor: AppColors.primary,
              backgroundImage: AssetImage(svNotifier.sinhVien.urlimg),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppKeys.bg), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          ),
          backgroundColor: Colors.transparent,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                svNotifier.sinhVien.hoten,
                style: CustomTextWidget.appBarStyle(),
              )
            ],
          ),
          actions: [
            IconButton(
              color: AppColors.white,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.mainSinhVienScreen);
              },
              icon: const Icon(Icons.menu, size: 36),
            )
          ],
        ),
        key: scaffoldKey,
        body: SafeArea(
            child: ListView(
          children: [
            // InfoHome(context, scaffoldKey),
            vSizedBox1,
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Tính năng đặc biệt",
                  style: CustomTextWidget.bodyTextB3(color: Colors.black87),
                )),
            vSizedBox1,
            Container(
              height: 120.0,
              padding: const EdgeInsets.all(10.0),
              color: AppColors.white,
              child: ListView.builder(
                  itemCount: listDacbiet.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = listDacbiet[index];
                    return CustomItemButton.customItemButtonHeader(
                      onTap: () =>
                          {Navigator.of(context).pushNamed(item.routername)},
                      title: item.title,
                      icons: item.iconData,
                      color: item.color,
                    );
                  }),
            ),
            vSizedBox1,
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Danh sách tính năng",
                  style: CustomTextWidget.bodyTextB3(color: Colors.black87),
                )),
            vSizedBox1,
            Container(
              height: (MediaQuery.of(context).size.height - 200),
              margin: const EdgeInsets.symmetric(vertical: 2.0),
              padding: const EdgeInsets.all(10.0),
              color: AppColors.white,
              child: GridView.builder(
                primary: false,
                padding: const EdgeInsets.all(4),
                itemCount: listMenu.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: max(currentCount, minCount)),
                itemBuilder: ((context, index) {
                  final item = listMenu[index];
                  return CustomItemButton.customItemButton(
                    onTap: () {
                      showDiemDanh(item.routername);
                    },
                    title: item.title,
                    icons: item.iconData,
                    color: item.color,
                  );
                }),
              ),
            ),
          ],
        )));
  }
}
