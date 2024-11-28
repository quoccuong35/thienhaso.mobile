// ignore_for_file: curly_braces_in_flow_control_structures, use_build_context_synchronously, duplicate_ignore, non_constant_identifier_names

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/core/api/diemdanh.api.dart';
import 'package:mobile/core/models/classsubject.dart';

import 'package:mobile/core/models/subjectcheckinglist.dart';

import 'package:mobile/core/utils/snackbar.util.dart';

class DiemDanhNotifier with ChangeNotifier {
  // ignore: unnecessary_new
  DiemDanhApi diemDanhApi = new DiemDanhApi();

  Future classSubjectList({required BuildContext context}) async {
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
      var result = await diemDanhApi.getClassSubjectList(
          token: token,
          username: username,
          studentID: studentID,
          context: context);
      if (result['responseCode'] == 0) {
        List<ClassSubject> data = List.from(result['body'])
            .map((e) => ClassSubject.fromJson(e))
            .toList();
        return data;
      } else {
        showSnackBar(text: result['responseDesc'], context: context);
        return null;
      }
    }
  }

  Future subjectCheckingList(
      {required BuildContext context, required int classSubjectID}) async {
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
      var result = await diemDanhApi.subjectCheckingList(
          token: token,
          username: username,
          studentID: studentID,
          classSubjectID: classSubjectID,
          context: context);
      if (result['responseCode'] == 0) {
        List<SubjectCheckingList> data = List.from(result['body'])
            .map((e) => SubjectCheckingList.fromJson(e))
            .toList();
        return data;
      } else {
        // showSnackBar(text: result['responseDesc'], context: context);

        return null;
      }
    }
  }
}
