import 'package:flutter/material.dart';
import 'package:mobile/core/models/objresult.dart';
import 'package:mobile/core/notifiers/bangdiem.notifier.dart';
import 'package:mobile/presentation/screens/bangdiemScreen/widgets/toankhoa.card.widget.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class ToanKhoa extends StatelessWidget {
  const ToanKhoa({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BangDiemNotifier>(builder: (context, bangdiem, _) {
      return FutureBuilder(
          future: bangdiem.getSubjectMarkOfCourse(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLoading.Loading(context: context);
            } else if (!snapshot.hasData) {
              return CustomDataEntyWidget.KhongCoDuLieu();
            } else {
              var data = snapshot.data as List<ObjResult>;
              return ListView(
                padding: const EdgeInsets.all(5),
                children: List<Widget>.generate(data.length, (int index) {
                  return ToanKhoaCard(context: context, obj: data[index]);
                }),
              );
            }
          });
    });
  }
}
