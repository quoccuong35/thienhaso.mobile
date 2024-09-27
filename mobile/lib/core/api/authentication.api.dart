import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/app/constants/app.keys.dart';

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
      "schoolIdentity": AppKeys.schoolIdentity,
      "loginName": usrename,
      "Password": userpassword,
    });
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": token
    };
    final http.Response response =
        await client.post(uri, headers: headers, body: bodypara);
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

  Future setHeaders({required authorization}) async {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Authorization": authorization
    };
  }
}
