import 'package:flutter/material.dart';
import 'package:mobile/core/notifiers/lang.notifiers.dart';

import 'package:mobile/core/notifiers/student.notifer.dart';
import 'package:mobile/presentation/screens/sinhvienScreen/widgets/caidat.widget.dart';
import 'package:mobile/presentation/screens/sinhvienScreen/widgets/header.widget.dart';
import 'package:mobile/presentation/screens/sinhvienScreen/widgets/hoso.widget.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

import 'package:provider/provider.dart';

class MainSinhVienScreen extends StatelessWidget {
  const MainSinhVienScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentNotifier studentNotifier = Provider.of<StudentNotifier>(context);
    var user = studentNotifier.student;
    return Consumer<LangNotifiers>(builder: (context, lang, _) {
      return Scaffold(
        appBar: HeaderWidgetV1(
            context: context, hoten: user.fullName!, urlimg: user.urlImge),
        body: SafeArea(
          top: false,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              HoSoWidget(user: user),
              vSizedBox1,
              dividerH2B1w2,
              vSizedBox1,
              CaiDat(context: context, lang: lang, sv: studentNotifier),
            ],
          ),
        ),
      );
    });
  }
}
