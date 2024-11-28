import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/app/routers/api.routes.dart';
import 'package:mobile/core/api/api.dart';

class DiemDanhApi {
  Api api = Api();
  Future getClassSubjectList(
      {required String token,
      required String username,
      required int studentID,
      required BuildContext context}) async {
    const subUrl = '/SIM_Student/ClassSubjectList';
    final body = jsonEncode({
      "schoolIdentity": ApiRoutes.schoolIdentity,
      "username": username,
      "studentID": studentID,
    });

    return await api.postApi(
        subUrl: subUrl, context: context, token: token, body: body);
  }

  Future subjectCheckingList(
      {required String token,
      required String username,
      required int studentID,
      required int classSubjectID,
      required BuildContext context}) async {
    const subUrl = '/SIM_Student/SubjectCheckingList';
    final body = jsonEncode({
      "schoolIdentity": ApiRoutes.schoolIdentity,
      "username": username,
      "studentID": studentID,
      "classSubjectID": classSubjectID
    });

    return await api.postApi(
        subUrl: subUrl, context: context, token: token, body: body);
  }
}
