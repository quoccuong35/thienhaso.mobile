// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/core/notifiers/theme.notifier.dart';
import 'package:mobile/core/notifiers/thoikhoabieu.notifier.dart';
import 'package:mobile/presentation/screens/thoikhoabieuScreen/widgets/chonngay.dart';
import 'package:mobile/presentation/screens/thoikhoabieuScreen/widgets/groupedlistview.widget.dart';
import 'package:mobile/presentation/widgets/custom.back.btn.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class ThoiKhoaBieuScreen extends StatefulWidget {
  const ThoiKhoaBieuScreen({super.key});

  @override
  State<ThoiKhoaBieuScreen> createState() => _ThoiKhoaBieuScreenState();
}

class _ThoiKhoaBieuScreenState extends State<ThoiKhoaBieuScreen> {
  @override
  void initState() {
    final provider = Provider.of<ThoiKhoaBieuNotifier>(context, listen: false);
    provider.getDataFromAPI(context: context);
    super.initState();
  }

  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    // ignore: unused_local_variable
    var themeFlag = themeNotifier.darkTheme;
    // ignore: unused_local_variable
    return SafeArea(
        top: false,
        child: Scaffold(
          //backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Center(
                child: Text(
              "Lịch học - lịch thi",
              style: CustomTextWidget.appBarStyle(),
            )),
            flexibleSpace: const Image(
              image: AssetImage(AppKeys.bg),
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.transparent,
            leading: const CustomBackPop(),
            actions: [
              Consumer<ThoiKhoaBieuNotifier>(
                  builder: (context, thoikhoabieu, _) {
                return IconButton(
                  color: Colors.white,
                  onPressed: () {
                    ChonNgay(context, thoikhoabieu);
                  },
                  icon: const Icon(
                    Icons.content_paste_search,
                    size: 36.0,
                  ),
                );
              })
            ],
          ),
          bottomNavigationBar: Consumer<ThoiKhoaBieuNotifier>(
              builder: (context, thoikhoabieu, _) {
            return BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: "Tất Cả",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_view_month),
                  label: "Lịch Học",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined),
                  label: "Lịch Thi",
                )
              ],
              currentIndex: thoikhoabieu.selectedIndexTab,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.black,
              onTap: (index) => thoikhoabieu.onItemTapped(index),
            );
          }),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30.0,
                color: Colors.black26,
                child: Consumer<ThoiKhoaBieuNotifier>(
                    builder: (context, thoikhoabieu, _) {
                  return Center(
                    child: Text(
                      thoikhoabieu.titlesearch,
                      style: CustomTextWidget.bodyTextS14B(),
                    ),
                  );
                }),
              ),
              Consumer<ThoiKhoaBieuNotifier>(
                builder: (context, thoikhoabieu, _) {
                  return Expanded(
                    child: thoikhoabieu.isLoading
                        ? CustomLoading.Loading(context: context)
                        : thoikhoabieu.serachedThoiKhoaBieu.isEmpty
                            ? CustomDataEntyWidget.KhongCoDuLieu()
                            : GroupedListViewWidget(
                                data: thoikhoabieu.serachedThoiKhoaBieu,
                                context: context,
                                controller: controller),
                  );
                },
              ),
              Consumer<ThoiKhoaBieuNotifier>(
                builder: (context, thoikhoabieu, _) {
                  return thoikhoabieu.selectedIndexTab == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: thoikhoabieu.lichhoc,
                                  onChanged: (value) {
                                    thoikhoabieu.onChangedLichHoc(value!);
                                  },
                                  checkColor: AppColors.white,
                                  activeColor: AppColors.primary,
                                ),
                                const Text("Lịch học")
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: thoikhoabieu.lichthi,
                                  onChanged: (value) {
                                    thoikhoabieu.onChangedLichThi(value!);
                                  },
                                  checkColor: AppColors.white,
                                  activeColor: AppColors.primary,
                                ),
                                const Text("Lịch thi")
                              ],
                            )
                          ],
                        )
                      : const Text("");
                },
              ),
            ],
          ),
        ));
  }
}
