// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/core/models/schedulelist.dart';
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
    fontSize: 14.0,
    fontFamily: AppFonts.contax,
    overflow: TextOverflow.clip,
  );
}

Widget ThoiKhoaBieuItemNew(
    {required ScheduleList element, required BuildContext context}) {
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
                  "Tiết ${element.fromLessionTime!.toString()}-${element.toLessionTime!.toString()}",
                  style: styletiet(),
                ),
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: element.isTestSchedule == 0
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
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: colors[index],
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Text(
                          '${element.subjectID}:${element.subjectName}',
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
                            child: Row(
                              children: [
                                Icon(
                                  Icons.room,
                                  color: colors[index],
                                ),
                                Text(
                                  element.roomID!,
                                  style: stylethongtin(),
                                ),
                              ],
                            ),
                          ),
                          hSizedBox1,
                          Expanded(
                              child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: colors[index],
                              ),
                              Text(
                                element.teacherName!,
                                style: stylethongtin(),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
