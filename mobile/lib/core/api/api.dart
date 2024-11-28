// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/app/constants/app.functions.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/app/routers/api.routes.dart';
import 'package:mobile/core/utils/snackbar.util.dart';

class Api {
  final client = http.Client();
  Map<String, String>? setHeaders({required authorization}) {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      "Authorization": authorization
    };
    return headers;
  }

  Future postApi(
      {required String subUrl,
      required BuildContext context,
      Object? body,
      required String token}) async {
    try {
      final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
      final http.Response response = await client
          .post(uri, headers: setHeaders(authorization: token), body: body)
          .timeout(Duration(seconds: AppKeys.timeOut));
      JsonDecoder jsonDecoder = const JsonDecoder();
      if (response.statusCode == 200) {
        return jsonDecoder.convert(response.body);
      } else {
        throw Exception(AppFunctions.customExceptionStatusCodeApi(
            response.statusCode, subUrl));
      }
    } on SocketException catch (_) {
      showSnackBar(context: context, text: "Không kết nói được Internet");
    } on TimeoutException catch (e) {
      showSnackBar(context: context, text: 'Hết thời gian thao tác $e');
    } on HttpException {
      showSnackBar(
          context: context,
          text: 'Không tìm thấy đường dẫn trên máy chủ Máy chủ $subUrl');
    } on FormatException {
      showSnackBar(context: context, text: 'Định dạng phản hồi không hợp lệ');
    } on Exception catch (e) {
      // ignore: avoid_print
      showSnackBar(context: context, text: e.toString());
    }
  }
}
