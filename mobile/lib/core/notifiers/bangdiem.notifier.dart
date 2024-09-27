// ignore_for_file: use_build_context_synchronously, curly_braces_in_flow_control_structures, unnecessary_null_comparison, duplicate_ignore

import 'dart:io';

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/core/api/bangdiem.api.dart';
import 'package:mobile/core/models/data/datas.dart';
import 'package:mobile/core/models/objresult.dart';
import 'package:mobile/core/models/subjectmarkdetail.dart';
import 'package:mobile/core/models/subjectmarkofsemester.dart';

import 'package:mobile/core/utils/snackbar.util.dart';

class BangDiemNotifier with ChangeNotifier {
  BangDiemApi bangDiemApi = BangDiemApi();
  Future getSubjectMarkOfCourse({required BuildContext context}) async {
    // bảng điểm toàn khóa
    try {
      String token = "";
      await ReadCache.getString(key: AppKeys.token).then((value) {
        if (value != null) {
          token = value;
        }
      });
      String username = "";
      await ReadCache.getString(key: AppKeys.username).then((value) {
        if (value != null) {
          username = value;
        }
      });
      int studentID = 0;
      await ReadCache.getInt(key: AppKeys.studentID).then((value) {
        if (value != null) {
          studentID = value;
        }
      });
      if (token != "" && username != "" && studentID > 0) {
        var result = await bangDiemApi.getSubjectMarkOfCourse(
            token: token, username: username, studentID: studentID);
        if (result['responseCode'] == 0) {
          List<ObjResult> data = List.from(result['body'])
              .map((e) => ObjResult.fromJson(e))
              .toList();
          return data;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
              text: result['responseDesc'], context: context));
          return null;
        }
      } else {
        return null;
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    }
  }

  Future getSubjectMarkOfSemester({required BuildContext context}) async {
    // bảng điểm toàn khóa
    try {
      String token = "";
      await ReadCache.getString(key: AppKeys.token).then((value) {
        if (value != null) {
          token = value;
        }
      });
      String username = "";
      await ReadCache.getString(key: AppKeys.username).then((value) {
        if (value != null) {
          username = value;
        }
      });
      int studentID = 0;
      await ReadCache.getInt(key: AppKeys.studentID).then((value) {
        if (value != null) {
          studentID = value;
        }
      });
      if (token != "" && username != "" && studentID > 0) {
        var result = await bangDiemApi.getSubjectMarkOfSemester(
            token: token, username: username, studentID: studentID);
        if (result['responseCode'] == 0) {
          List<SubjectMarkOfSemester> data = List.from(result['body'])
              .map((e) => SubjectMarkOfSemester.fromJson(e))
              .toList();
          return data;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
              text: result['responseDesc'], context: context));
          return null;
        }
      } else {
        return null;
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    }
  }

  Future getSubjectMarkDetail({required BuildContext context}) async {
    // bảng điểm toàn khóa
    try {
      String token = "";
      await ReadCache.getString(key: AppKeys.token).then((value) {
        if (value != null) {
          token = value;
        }
      });
      String username = "";
      await ReadCache.getString(key: AppKeys.username).then((value) {
        if (value != null) {
          username = value;
        }
      });
      int studentID = 0;
      await ReadCache.getInt(key: AppKeys.studentID).then((value) {
        if (value != null) {
          studentID = value;
        }
      });
      if (token != "" && username != "" && studentID > 0) {
        var result = await bangDiemApi.getSubjectMarkDetail(
            token: token, username: username, studentID: studentID);
        if (result['responseCode'] == 0) {
          List<SubjectMarkDetail> data = List.from(result['body'])
              .map((e) => SubjectMarkDetail.fromJson(e))
              .toList();
          // List<SubjectMarkDetail> data = List.from(Datas.testDiemChiTiet)
          //     .map((e) => SubjectMarkDetail.fromJson(e))
          //     .toList();
          // print(data.length);
          return data;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
              text: result['responseDesc'], context: context));
          return null;
        }
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
      String masv = "10000558";
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
      String masv = "10000558";
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
