import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/notifiers/hocphi.notifer.dart';
import 'package:mobile/presentation/screens/hocphi/widgets/cackhoanthu.card.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/khongcodulieu.widget.dart';
import 'package:mobile/presentation/widgets/loading.widget.dart';
import 'package:provider/provider.dart';

class CacKhoanThu extends StatelessWidget {
  const CacKhoanThu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HocPhiNotifier>(builder: (context, hocPhi, _) {
      return FutureBuilder(
          future: hocPhi.getKhoanThu(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLoading.Loading(context: context);
            } else if (!snapshot.hasData) {
              return CustomDataEntyWidget.KhongCoDuLieu();
            } else {
              var data = snapshot.data;

              return GroupedListView<dynamic, String>(
                  floatingHeader: true,
                  elements: data,
                  groupBy: (element) => element['YearText'],
                  useStickyGroupSeparators: true,
                  sort: false,
                  groupSeparatorBuilder: (value) {
                    return Container(
                      width: double.infinity,
                      height: 45.0,
                      color: AppColors.color1,
                      child: Center(
                        child: Text(value,
                            style: CustomTextWidget.bodyTextS14Cblue()),
                      ),
                    );
                  },
                  itemBuilder: (context, element) {
                    return CacKhoanThuCard(item: element, context: context);
                  });
            }
          });
    });
  }
}
