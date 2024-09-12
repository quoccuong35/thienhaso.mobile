import 'package:flutter/material.dart';
import 'package:mobile/core/models/diemdanhtonghop.dart';
import 'package:mobile/core/notifiers/diemdanh.notifier.dart';
import 'package:mobile/presentation/screens/diemdanhScreen/widgets/diemdanhtonghop.widget.dart';
import 'package:mobile/presentation/widgets/custom.appbar.dart';

import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class DiemDanhTongHopScreen extends StatelessWidget {
  const DiemDanhTongHopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: CustomAppbar("Điểm danh", context),
          body: Consumer<DiemDanhNotifier>(builder: (context, bangdiem, _) {
            return FutureBuilder(
                future: bangdiem.diemDanhTongHop(context: context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomLoading.Loading(context: context);
                  } else if (!snapshot.hasData) {
                    return CustomDataEntyWidget.KhongCoDuLieu();
                  } else {
                    var data = snapshot.data as List<DiemDanhTongHop>;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DiemTongHopWidget(items: data, swidth: swidth),
                      ),
                    );
                  }
                });
          }),
        ));
  }
}
