// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'dart:io';

import 'package:cache_manager/core/read_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/core/models/data/datas.dart';
import 'package:mobile/core/models/sinhvien.dart';
import 'package:mobile/core/utils/snackbar.util.dart';

class SinhVienNotifier with ChangeNotifier {
  // ignore: unnecessary_new
  late SinhVien _sinhVien = SinhVien.enty();
  SinhVien get sinhVien => _sinhVien;

  Future setSinhVien() async {
    String masv = "";
    await ReadCache.getString(key: AppKeys.userData).then((value) {
      if (value != null) {
        masv = value;
      }
    });
    if (masv != "") {
      var data = Datas.item.firstWhere((it) => it.masv == masv);
      _sinhVien.masv = data.masv;
      _sinhVien.hoten = data.hoten;
      _sinhVien.gioitinh = data.gioitinh;
      _sinhVien.ngaysinh = data.ngaysinh;
      _sinhVien.noisinh = data.noisinh;
      _sinhVien.nguyenquan = data.nguyenquan;
      _sinhVien.lop = data.lop;
      _sinhVien.sodienthoai = data.sodienthoai;
      _sinhVien.email = data.email;
      _sinhVien.nienkhoa = data.nienkhoa;
      _sinhVien.nganhnghe = data.nganhnghe;
      _sinhVien.urlimg = data.urlimg;
      notifyListeners();
    }
  }

  Future<void> setEmtySV() async {
    _sinhVien = SinhVien.enty();
    notifyListeners();
  }

  Future SinhienInfor({required BuildContext context}) async {
    try {
      String masv = "";
      await ReadCache.getString(key: AppKeys.userData).then((value) {
        if (value != null) {
          masv = value;
        }
      });
      // ignore: unnecessary_null_comparison
      if (masv != null && masv != "") {
        return Datas.item.firstWhere((it) => it.masv == masv);
      } else {
        return null;
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    }
  }
}
