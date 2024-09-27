// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:mobile/core/api/student.api.dart';
import 'package:mobile/core/models/studentinfo.dart';
import 'package:mobile/core/utils/snackbar.util.dart';

class StudentNotifier extends ChangeNotifier {
  StudentApi studentApi = StudentApi();
  late StudentInfo _student;
  StudentInfo get student => _student;
  setEmtySV() {
    _student.setEmty();
    notifyListeners();
  }

  Future getInfo(
      {required int studentID,
      required String username,
      required String token,
      required BuildContext context}) async {
    try {
      var reponse = await studentApi.getInfo(
          token: token, username: username, studentID: studentID);
      if (reponse['responseCode'] == 0) {
        _student = StudentInfo.fromJson(reponse['body']);
        notifyListeners();
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
            text: reponse['responseDesc'], context: context));
        return false;
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
      return false;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }
}
