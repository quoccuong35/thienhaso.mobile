import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/app/constants/app.keys.dart';

import '../../app/routers/api.routes.dart';

class StudentApi {
  final client = http.Client();
  Future getInfo(
      {required String token,
      required String username,
      required int studentID}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": token
    };
    const subUrl = '/SIM_Student/GetInfo';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final body = jsonEncode({
      "schoolIdentity": AppKeys.schoolIdentity,
      "username": username,
      "studentID": studentID,
    });
    final http.Response response =
        await client.post(uri, headers: headers, body: body);
    JsonDecoder jsonDecoder = const JsonDecoder();
    return jsonDecoder.convert(response.body);
  }
}
