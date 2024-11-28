import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/app/routers/api.routes.dart';

class BangDiemApi {
  final client = http.Client();

  Future getSubjectMarkOfCourse(
      {required String token,
      required String username,
      required int studentID}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": token
    };
    const subUrl = '/SIM_Student/GetSubjectMarkOfCourse';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final body = jsonEncode({
      "schoolIdentity": ApiRoutes.schoolIdentity,
      "username": username,
      "studentID": studentID,
    });
    final http.Response response =
        await client.post(uri, headers: headers, body: body);
    JsonDecoder jsonDecoder = const JsonDecoder();
    return jsonDecoder.convert(response.body);
  }

  Future getSubjectMarkOfSemester(
      {required String token,
      required String username,
      required int studentID}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": token
    };
    const subUrl = '/SIM_Student/GetSubjectMarkOfSemester';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final body = jsonEncode({
      "schoolIdentity": ApiRoutes.schoolIdentity,
      "username": username,
      "studentID": studentID,
    });
    final http.Response response =
        await client.post(uri, headers: headers, body: body);
    JsonDecoder jsonDecoder = const JsonDecoder();
    return jsonDecoder.convert(response.body);
  }

  Future getSubjectMarkDetail(
      {required String token,
      required String username,
      required int studentID}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": token
    };
    const subUrl = '/SIM_Student/GetSubjectMarkDetail';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final body = jsonEncode({
      "schoolIdentity": ApiRoutes.schoolIdentity,
      "username": username,
      "studentID": studentID,
    });
    final http.Response response =
        await client.post(uri, headers: headers, body: body);
    JsonDecoder jsonDecoder = const JsonDecoder();
    return jsonDecoder.convert(response.body);
  }
}
