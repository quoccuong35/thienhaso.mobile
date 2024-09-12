// ignore_for_file: curly_braces_in_flow_control_structures, use_build_context_synchronously, duplicate_ignore

import 'dart:io';

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.keys.dart';

import 'package:mobile/core/models/data/datas.dart';

import 'package:mobile/core/utils/snackbar.util.dart';

class DiemDanhNotifier with ChangeNotifier {
  Future diemDanhTongHop({required BuildContext context}) async {
    try {
      String masv = "";
      await ReadCache.getString(key: AppKeys.userData).then((value) {
        if (value != null) {
          masv = value;
        }
      });
      // ignore: unnecessary_null_comparison
      if (masv != null && masv != "") {
        var data = Datas.items.where((it) => it.masv == masv);
        if (data.isNotEmpty)
          // ignore: curly_braces_in_flow_control_structures
          return data.toList();
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

  Future diemDanhMonHoc({required BuildContext context}) async {
    try {
      String masv = "";
      await ReadCache.getString(key: AppKeys.userData).then((value) {
        if (value != null) {
          masv = value;
        }
      });
      if (masv != null && masv != "") {
        var data = Datas.diemdanhmonhoc.where((it) => it.masv == masv).toList();
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
}
