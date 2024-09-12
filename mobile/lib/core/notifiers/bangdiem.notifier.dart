// ignore_for_file: use_build_context_synchronously, curly_braces_in_flow_control_structures, unnecessary_null_comparison

import 'dart:io';

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/core/models/data/datas.dart';

import 'package:mobile/core/utils/snackbar.util.dart';

class BangDiemNotifier with ChangeNotifier {
  Future bangDiemToanKhoa({required BuildContext context}) async {
    try {
      String masv = "";
      await ReadCache.getString(key: AppKeys.userData).then((value) {
        if (value != null) {
          masv = value;
        }
      });
      if (masv != null && masv != "") {
        return Datas.bangdiemtoankhoas.firstWhere((it) => it.masv == masv);
      } else {
        return null;
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    }
  }

  Future bangHocKy({required BuildContext context}) async {
    try {
      String masv = "";
      await ReadCache.getString(key: AppKeys.userData).then((value) {
        if (value != null) {
          masv = value;
        }
      });
      if (masv != null && masv != "") {
        var data = Datas.bangdiemhockys.where((it) => it.masv == masv).toList();
        if (data.isNotEmpty)
          return data;
        else
          return null;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    }
  }

  Future bangDiemChiTiet({required BuildContext context}) async {
    try {
      String masv = "";
      await ReadCache.getString(key: AppKeys.userData).then((value) {
        if (value != null) {
          masv = value;
        }
      });
      // ignore: unnecessary_null_comparison
      if (masv != null && masv != "") {
        var data = Datas.diemchitiet.where((it) => it.masv == masv).toList();
        if (data.isNotEmpty)
          // ignore: duplicate_ignore
          // ignore: curly_braces_in_flow_control_structures
          return data;
        else
          return null;
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
