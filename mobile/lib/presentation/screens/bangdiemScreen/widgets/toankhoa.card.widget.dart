import 'package:flutter/material.dart';
import 'package:mobile/core/models/objresult.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

Widget ToanKhoaCard({required BuildContext context, required ObjResult obj}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(obj.fieldCaption,
              style: CustomTextWidget.captionStyle(obj.captionStyle)),
          Text(
            obj.fieldValue,
            style: CustomTextWidget.valueStyle(obj.valueStyle),
          )
        ],
      ),
      vSizedBox1,
      dividerH2B1w2,
      vSizedBox1,
    ],
  );
}
