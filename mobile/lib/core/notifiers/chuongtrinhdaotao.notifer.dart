import 'dart:convert';
import 'dart:io';

import 'package:cache_manager/core/read_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/app/routers/api.routes.dart';
import 'package:mobile/core/api/api.dart';
import 'package:mobile/core/utils/snackbar.util.dart';

class ChuongTrinhDaoTaoNotifier with ChangeNotifier {
  Api api = Api();

  Future gethuongTrinhDaoTao({required BuildContext context}) async {
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
        const subUrl = '/SIM_Student/SBSList';
        final body = jsonEncode({
          "schoolIdentity": ApiRoutes.schoolIdentity,
          "username": username,
          "studentID": studentID,
        });
        var result = await api.postApi(
            subUrl: subUrl, context: context, body: body, token: token);
        if (result['responseCode'] == 0) {
          var data = result['body'];
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
}
