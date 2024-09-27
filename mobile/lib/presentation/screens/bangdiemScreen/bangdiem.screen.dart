import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/notifiers/student.notifer.dart';

import 'package:mobile/presentation/screens/bangdiemScreen/widgets/chitiet.widget.dart';
import 'package:mobile/presentation/screens/bangdiemScreen/widgets/hocky.widget.dart';
import 'package:mobile/presentation/screens/bangdiemScreen/widgets/toankhoa.widget.dart';
import 'package:mobile/presentation/widgets/custom.appbar.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:provider/provider.dart';

class BangDiemScreen extends StatelessWidget {
  const BangDiemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);

    // var themeFlag = _themeNotifier.darkTheme;
    StudentNotifier sv = Provider.of<StudentNotifier>(context);
    return SafeArea(
        top: false,
        child: Scaffold(
            appBar: CustomAppbar("Bảng điểm", context),
            body: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Material(
                    child: Container(
                      height: 35,
                      width: width,
                      color: const Color.fromRGBO(173, 173, 173, 0.2),
                      margin: const EdgeInsets.only(top: 5.0),
                      child: TabBar(
                        isScrollable: false,
                        physics: const ClampingScrollPhysics(),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: AppColors.white,
                        padding: const EdgeInsets.all(0.0),
                        indicator: BoxDecoration(
                          color: AppColors.primary,
                        ),
                        tabs: [
                          Tab(
                            child: SizedBox(
                              width: width * 0.3,
                              height: 35,
                              child: const Center(
                                child: Text("Toàn khóa"),
                              ),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              height: 35,
                              width: width * 0.4,
                              child: const Center(
                                child: Text("Học kỳ"),
                              ),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              height: 35,
                              width: width * 0.7,
                              child: const Center(
                                child: Text("Chi tiết"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      backgroundImage: AssetImage(sv.student.urlImge),
                    ),
                    title: Text(sv.student.fullName!,
                        style: CustomTextWidget.bodyTextS16W9()),
                    subtitle: Text(sv.student.studentCode!),
                  ),
                  dividerH2B,
                  const Expanded(
                    child: TabBarView(
                      children: [ToanKhoa(), HocKy(), ChiTiet()],
                    ),
                  )
                ],
              ),
            )));
  }
}
