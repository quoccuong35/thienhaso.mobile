import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/core/models/schedulelist.dart';
import 'package:mobile/presentation/screens/thoikhoabieuScreen/widgets/thoikhoabieuitem.widget.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';

// ignore: non_constant_identifier_names
Widget GroupedListViewWidget(
    {required List<ScheduleList> data,
    required BuildContext context,
    required ScrollController controller}) {
  return GroupedListView<dynamic, String>(
      floatingHeader: true,
      elements: data,
      groupBy: (element) => element.date,
      useStickyGroupSeparators: true,
      controller: controller,
      sort: false,
      groupSeparatorBuilder: (value) {
        return Container(
          width: double.infinity,
          height: 45.0,
          color: AppColors.color1,
          child: Center(
            child: Text(value, style: CustomTextWidget.bodyTextS14Cblue()),
          ),
        );
      },
      itemBuilder: (context, element) {
        return ThoiKhoaBieuItemNew(element: element, context: context);
      });
}
