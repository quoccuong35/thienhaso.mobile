// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/app/routers/app.routes.dart';
import 'package:mobile/core/models/menu.dart';
import 'package:mobile/core/models/data/menus.dart';
import 'package:mobile/core/notifiers/notifylist.notifer.dart';
import 'package:mobile/core/notifiers/student.notifer.dart';
import 'package:mobile/core/notifiers/theme.notifier.dart';
import 'package:mobile/presentation/screens/homeScreen/widgets/custom.item.button.dart';
import 'package:mobile/presentation/screens/sinhvienScreen/main.sinhvien.screen.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Menu> listMenu = Menus.items.toList();
    var listDacbiet = listMenu.where((it) {
      return it.datbiet == true;
    }).toList();
    var listMenu1 = listMenu.where((it) {
      return it.datbiet == false;
    }).toList();
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    // ignore: duplicate_ignore
    // ignore: unused_local_variable
    final currentCount =
        ((MediaQuery.of(context).size.width - 20) / 100).toInt();
    const minCount = 3;
    StudentNotifier studentNotifier = Provider.of<StudentNotifier>(context);
    NotifyListNotifier notify = Provider.of<NotifyListNotifier>(context);
    int counter = notify.counter;
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

    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 10.5,
          toolbarHeight: 100.0,
          automaticallyImplyLeading: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                    studentNotifier.student.avatarUrl!,
                  ),
                ),
              ),
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
                studentNotifier.student.fullName!,
                style: CustomTextWidget.appBarStyle(),
              ),
              Text(
                studentNotifier.student.courseName!,
                style: TextStyle(
                    fontFamily: AppFonts.lato,
                    color: AppColors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          actions: [
            IconButton(
              color: AppColors.white,
              onPressed: () {
                //Navigator.of(context).pushNamed(AppRouter.mainSinhVienScreen);
                Navigator.of(context).push(
                  AppRouter.createRoute(
                    Page2: const MainSinhVienScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.menu, size: 36),
            )
          ],
        ),
        key: scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.1, // Adjust the opacity for the watermark effect
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppKeys.logo, width: 300, // Set the width
                      height: 300, // Set the height
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ListView(
                children: [
                  // InfoHome(context, scaffoldKey),
                  Container(
                    height: 20,
                    color: AppColors.creamColor,
                  ),
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primary
                            .withOpacity(0.5) // Rounded corners
                        ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white // Rounded corners
                          ),
                      margin: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                          itemCount: listDacbiet.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final item = listDacbiet[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(item.routername);
                              },
                              child: Container(
                                height: 80.0,
                                width: 150.0,
                                margin: const EdgeInsets.all(5.0),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      item.color,
                                      item.color.withOpacity(0.9),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: const Offset(5, 5),
                                      blurRadius: 10.0,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.5),
                                      offset: const Offset(-5, -5),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Icon(
                                        item.iconData,
                                        size: 40,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        item.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  //vSizedBox1,
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10),
                  //   child: Text(
                  //     "Danh sách tính năng",
                  //     style: CustomTextWidget.bodyTextB3(color: Colors.black87),
                  //   ),
                  // ),
                  Container(
                    height: 20,
                    color: AppColors.creamColor,
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height - 200),
                    margin: const EdgeInsets.symmetric(vertical: 2.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: GridView.builder(
                      primary: false,
                      padding: const EdgeInsets.all(4),
                      itemCount: listMenu1.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: max(currentCount, minCount)),
                      itemBuilder: ((context, index) {
                        final item = listMenu1[index];
                        return item.routername == "/thongBao" && counter > 0
                            ? CustomItemButton.customItemButtonThongBao(
                                onTap: () {
                                  showDiemDanh(item.routername);
                                },
                                title: item.title,
                                icons: item.iconData,
                                color: item.color,
                                soLuong: counter)
                            : CustomItemButton.customItemButton(
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
                  Container(
                    height: 20,
                    color: AppColors.creamColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
