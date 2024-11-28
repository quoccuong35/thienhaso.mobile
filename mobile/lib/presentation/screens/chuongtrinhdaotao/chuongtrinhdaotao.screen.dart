import 'package:flutter/material.dart';

import 'package:mobile/core/notifiers/chuongtrinhdaotao.notifer.dart';
import 'package:mobile/presentation/screens/chuongtrinhdaotao/widget/chuongtrinhdaotao.widget.dart';
import 'package:mobile/presentation/widgets/custom.appbar.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class ChuongTrinhDaoTao extends StatelessWidget {
  const ChuongTrinhDaoTao({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppbar("Chương trình đào tạo", context),
        body:
            Consumer<ChuongTrinhDaoTaoNotifier>(builder: (context, daoTao, _) {
          return FutureBuilder(
              future: daoTao.gethuongTrinhDaoTao(context: context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CustomLoading.Loading(context: context);
                } else if (!snapshot.hasData) {
                  return CustomDataEntyWidget.KhongCoDuLieu();
                } else {
                  var data = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 10.0),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text("Danh sách môn học",
                            style: CustomTextWidget.bodyTextB3(
                                color: Colors.black87)),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ChuongTrinhDaoTaoWidget(data: data),
                          ),
                        ),
                      )
                    ],
                  );
                }
              });
        }),
      ),
    );
  }
}
