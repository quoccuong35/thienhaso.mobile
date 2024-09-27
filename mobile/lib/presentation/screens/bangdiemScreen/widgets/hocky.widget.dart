import 'package:flutter/material.dart';
import 'package:mobile/core/models/subjectmarkofsemester.dart';
import 'package:mobile/core/notifiers/bangdiem.notifier.dart';
import 'package:mobile/presentation/screens/bangdiemScreen/widgets/hocky.card.widget.dart';
import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class HocKy extends StatelessWidget {
  const HocKy({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BangDiemNotifier>(builder: (context, bangdiem, _) {
      return FutureBuilder(
          future: bangdiem.getSubjectMarkOfSemester(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLoading.Loading(context: context);
            } else if (!snapshot.hasData) {
              return CustomDataEntyWidget.KhongCoDuLieu();
            } else {
              var data = snapshot.data as List<SubjectMarkOfSemester>;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return hocKyCard(item);
                  });
            }
          });
    });
  }
}
