import 'package:flutter/material.dart';
import 'package:mobile/core/models/menu.dart';

class Menus {
  static List<Menu> items = [
    Menu(
        title: "Thời khóa biểu",
        iconData: Icons.calendar_month,
        color: Colors.blue,
        datbiet: true,
        routername: "/thoiKhoaBieu"),
    Menu(
        title: "Bản điểm",
        iconData: Icons.featured_play_list_outlined,
        color: Colors.orangeAccent,
        datbiet: true,
        routername: "/bangDiem"),
    Menu(
        title: "Chương trình đào tạo",
        iconData: Icons.list_alt_sharp,
        color: Colors.blueGrey,
        datbiet: true,
        routername: ""),
    Menu(
        title: "Điểm danh",
        iconData: Icons.check_circle,
        color: Colors.lightGreen,
        datbiet: false,
        routername: "/diemDanh"),
    Menu(
        title: "Học phí",
        iconData: Icons.monetization_on,
        color: const Color.fromARGB(255, 36, 14, 21),
        datbiet: false,
        routername: ""),
    Menu(
        title: "Thông báo",
        iconData: Icons.info_rounded,
        color: const Color.fromARGB(255, 86, 87, 53),
        datbiet: false,
        routername: ""),
    Menu(
        title: "Mã QR",
        iconData: Icons.qr_code,
        color: Colors.purple,
        datbiet: false,
        routername: ""),
    Menu(
        title: "Tin tức",
        iconData: Icons.newspaper,
        color: const Color.fromRGBO(0, 98, 102, 1),
        datbiet: false,
        routername: ""),
    Menu(
        title: "Rèn luyện",
        iconData: Icons.medical_information,
        color: const Color.fromRGBO(111, 30, 81, 1.0),
        datbiet: false,
        routername: ""),
    Menu(
        title: "Khảo sát",
        iconData: Icons.swap_vert_sharp,
        color: const Color.fromRGBO(189, 197, 129, 1),
        datbiet: false,
        routername: ""),
    Menu(
        title: "Mẫu đơn",
        iconData: Icons.document_scanner_outlined,
        color: const Color.fromRGBO(88, 177, 159, 1),
        datbiet: false,
        routername: "")
  ];
}
