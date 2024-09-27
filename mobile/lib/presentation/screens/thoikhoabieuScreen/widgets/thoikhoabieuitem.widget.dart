// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

List<Color> colors = [
  const Color.fromRGBO(44, 44, 84, 1),
  const Color.fromRGBO(44, 62, 80, 1),
  const Color.fromRGBO(61, 61, 61, 1),
  const Color.fromARGB(255, 86, 87, 53),
  const Color.fromRGBO(0, 98, 102, 1)
];
List<IconData> icons = [
  Icons.menu_book,
  Icons.domain_verification_outlined,
  Icons.connected_tv_outlined,
  Icons.cottage_outlined,
  Icons.date_range_outlined,
];
TextStyle styletiet() {
  return const TextStyle(
      fontSize: 12.0,
      fontFamily: AppFonts.lato,
      overflow: TextOverflow.clip,
      color: Colors.white);
}

TextStyle stylehoc() {
  return const TextStyle(
      fontSize: 12.0,
      fontFamily: AppFonts.lato,
      overflow: TextOverflow.ellipsis,
      color: Colors.blue);
}

TextStyle stylethi() {
  return const TextStyle(
      fontSize: 12.0,
      fontFamily: AppFonts.lato,
      overflow: TextOverflow.ellipsis,
      color: Colors.red);
}

TextStyle stylethongtin() {
  return const TextStyle(
    fontSize: 13.0,
    fontFamily: AppFonts.contax,
    overflow: TextOverflow.clip,
  );
}

Widget ThoiKhoaBieuItemNew(
    {required dynamic element, required BuildContext context}) {
  var rnd = Random();
  int index = rnd.nextInt(5);
  return Card(
    elevation: 8.0,
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            decoration: BoxDecoration(
                color: colors[index],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  element["tiet"],
                  style: styletiet(),
                ),
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: element["loai"] == "01"
                      ? Text(
                          "Học",
                          style: stylehoc(),
                        )
                      : Text(
                          "Thi",
                          style: stylethi(),
                        ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icons[index],
                      color: colors[index],
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Text(
                        element['malophocphan'] +
                            ':' +
                            element['tenlophocphan'],
                        style: CustomTextWidget.bodyTextS14B(),
                      ),
                    ),
                  ],
                ),
                vSizedBox1,
                dividerH2B1w2,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            element['phong'],
                            style: stylethongtin(),
                          ),
                        ),
                        hSizedBox1,
                        Expanded(
                          child: Text(
                            element['giangvien'],
                            style: stylethongtin(),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget ThoiKhoaBieuItemold({required dynamic element}) {
  return Card(
    elevation: 10.0,
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: SizedBox(
      height: 140.0,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              element["tiet"],
              style: CustomTextWidget.bodyTextS14B(),
            ),
            element["loai"] == "01"
                ? Text(
                    "Lịch học",
                    style: CustomTextWidget.bodyTextS14Cblue(),
                  )
                : Text(
                    "Lịch thi",
                    style: CustomTextWidget.bodyTextS14W6red(),
                  )
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                element['malophocphan'] + ':' + element['tenlophocphan'],
                style: CustomTextWidget.bodyTextS14B(),
              ),
              vSizedBox1,
              dividerH2B1w2,
              vSizedBox1,
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phòng"),
                  Text("Giảng viên"),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    element['phong'],
                    style: CustomTextWidget.bodyTextS14B(),
                  ),
                  Text(
                    element['giangvien'],
                    style: CustomTextWidget.bodyTextS14B(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
