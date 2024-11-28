import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/notifiers/student.notifer.dart';
import 'package:mobile/presentation/screens/hocphi/widgets/cackhoanthu.widget.dart';
import 'package:mobile/presentation/screens/hocphi/widgets/lichsuthu.widget.dart';
import 'package:mobile/presentation/widgets/custom.appbar.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:provider/provider.dart';

class HocPhiScreen extends StatelessWidget {
  const HocPhiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    StudentNotifier sv = Provider.of<StudentNotifier>(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppbar("Học phí", context),
        body: DefaultTabController(
          length: 2,
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
                          width: width * 0.5,
                          height: 35,
                          child: const Center(
                            child: Text("Các khoản thu"),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          height: 35,
                          width: width * 0.4,
                          child: const Center(
                            child: Text("Lịch sử đóng tiền"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              dividerH2B,
              const Expanded(
                child: TabBarView(
                  children: [CacKhoanThu(), LichThuThu()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
