import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/app/routers/api.routes.dart';
import 'package:mobile/core/api/api.dart';

class ScheduleListApi {
  Api api = Api();
  Future getScheduleList(
      {required String token,
      required String username,
      required int studentID,
      required String fromDate,
      required String toDate,
      required BuildContext context}) async {
    const subUrl = '/SIM_Student/ScheduleList';
    final body = jsonEncode({
      "username": username,
      "schoolIdentity": ApiRoutes.schoolIdentity,
      "studentID": studentID,
      "fromDate": fromDate,
      "toDate": toDate,
    });

    return await api.postApi(
        subUrl: subUrl, context: context, token: token, body: body);
  }
}
