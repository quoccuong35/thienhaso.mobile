// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cache_manager/core/read_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/constants/app.functions.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/core/models/data/datas.dart';
import 'package:mobile/core/utils/snackbar.util.dart';

class ThoiKhoaBieuNotifier extends ChangeNotifier {
  late DateTime fromdate;
  late DateTime todate;
  late int selectedIndexTab;
  late List datas = [];
  late List serachedThoiKhoaBieu = [];
  late String titlesearch = "";
  late bool isLoading = true;
  late bool lichhoc = false;
  late bool lichthi = false;
  final f = DateFormat('dd/MM/yyyy');

  ThoiKhoaBieuNotifier() {
    fromdate = AppFunctions.startDateTheWeek(DateTime.now());
    todate = AppFunctions.lastDateTheWeek(DateTime.now());
    selectedIndexTab = 0;
    titlesearch = "${f.format(fromdate)} - ${f.format(todate)}";
  }
  Future<void> onItemTapped(int value) async {
    selectedIndexTab = value;
    uodateData();
  }

  setdate(DateTime from, DateTime to) {
    fromdate = from;
    todate = to;
    setTitle();
  }

  setTitle() {
    titlesearch = "${f.format(fromdate)} - ${f.format(todate)}";
  }

  onChangedLichHoc(bool value) {
    lichhoc = value;
    uodateData();
  }

  onChangedLichThi(bool value) {
    lichthi = value;
    uodateData();
  }

  Future getDataFromAPI({required BuildContext context}) async {
    if (!isLoading) {
      isLoading = !isLoading;
      notifyListeners();
    }
    try {
      String masv = "";
      await ReadCache.getString(key: AppKeys.userData).then((value) {
        if (value != null) {
          masv = value;
        }
      });
      // ignore: unnecessary_null_comparison
      if (masv != null && masv != "") {
        var data = Datas.thoikhoabien
            .where((it) =>
                it['masv'] == masv &&
                it['ngayhoc'].compareTo(fromdate) >= 0 &&
                it['ngayhoc'].compareTo(todate) <= 0)
            .toList();
        if (data.isNotEmpty) {
          datas = data;
        } else {
          datas.clear();
        }
      }
      setTitle();
      isLoading = false;
      uodateData();
    } on SocketException catch (_) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    }
  }

  uodateData() {
    //serachedThoiKhoaBieu.clear();
    if (selectedIndexTab == 0) {
      serachedThoiKhoaBieu = datas;
      if (lichhoc != lichthi) {
        if (lichhoc) {
          serachedThoiKhoaBieu =
              datas.where((it) => it['loai'] == '01').toList();
        } else if (lichthi) {
          serachedThoiKhoaBieu =
              datas.where((it) => it['loai'] == '02').toList();
        }
      }
    } else if (selectedIndexTab == 1) {
      serachedThoiKhoaBieu = datas.where((it) => it['loai'] == '01').toList();
    } else if (selectedIndexTab == 2) {
      serachedThoiKhoaBieu = datas.where((it) => it['loai'] == '02').toList();
    }
    notifyListeners();
  }
}
