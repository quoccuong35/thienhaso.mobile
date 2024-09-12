import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/core/notifiers/theme.notifier.dart';
import 'package:mobile/presentation/screens/thoikhoabieuScreen/widgets/lichhoc.widget.dart';
import 'package:mobile/presentation/screens/thoikhoabieuScreen/widgets/lichthi.widget.dart';
import 'package:mobile/presentation/screens/thoikhoabieuScreen/widgets/tatca.widget.dart';
import 'package:mobile/presentation/widgets/custom.back.btn.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ThoiKhoaBieuScreen extends StatelessWidget {
  ThoiKhoaBieuScreen({super.key});
  final List<Widget> widgetOption = <Widget>[
    const TatCa(),
    const LichHoc(),
    const LichThi()
  ];
  int selectedIndex = 0;
  void onItemTapped(int index) {
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    var themeFlag = themeNotifier.darkTheme;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
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
            IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.content_paste_search,
                size: 36.0,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Tất cả",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_month),
              label: "Lịch học",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: "Lịch thi",
            )
          ],
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.black,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
