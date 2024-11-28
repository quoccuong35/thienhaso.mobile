import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../app/routers/api.routes.dart';

class AuthenticationAPI {
  final client = http.Client();
  Future userLogin(
      {required String usrename,
      required String userpassword,
      required String token}) async {
    const subUrl = '/system/CheckLogin';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final bodypara = jsonEncode({
      "schoolIdentity": ApiRoutes.schoolIdentity,
      "loginName": usrename,
      "Password": userpassword,
    });
    // final headers = {
    //   'Content-Type': 'application/json',
    //   "Authorization": token
    // };
    final http.Response response = await client.post(uri,
        headers: setHeaders(authorization: token), body: bodypara);
    JsonDecoder jsonDecoder = const JsonDecoder();
    return jsonDecoder.convert(response.body);
  }

  Future<String?> authenticate() async {
    final client = http.Client();
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": ApiRoutes.secretKey
    };
    const subUrl = '/users/authenticate';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      JsonDecoder jsonDecoder = const JsonDecoder();
      final dynamic data = jsonDecoder.convert(response.body);
      return data['access_token'].toString();
    }
    return null;
  }

  Map<String, String>? setHeaders({required authorization}) {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": authorization
    };
    return headers;
  }
}
