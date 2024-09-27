// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile/core/notifiers/student.notifer.dart';
import 'package:provider/provider.dart';
import '../../app/constants/app.keys.dart';
import '../../app/routers/app.routes.dart';
import '../api/authentication.api.dart';
import 'package:cache_manager/cache_manager.dart';

import '../utils/snackbar.util.dart';

class AuthenticationNotifier with ChangeNotifier {
  final AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  String? _passwordLevel = "";
  String? get passwordLevel => _passwordLevel;

  String? _passwordEmoji = "";
  String? get passwordEmoji => _passwordEmoji;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  final bool _autoLogin = false;
  bool get autoLogin => _autoLogin;
  bool erroAuthen = false;

  void changeObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void toggleerroAuthen() {
    erroAuthen = true;
    notifyListeners();
  }

  void checkPasswordStrength({required String password}) {
    String mediumPattern = r'^(?=.*?[!@#\$&*~]).{8,}';
    String strongPattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    if (password.contains(RegExp(strongPattern))) {
      _passwordEmoji = '🚀';
      _passwordLevel = 'Strong';
      notifyListeners();
    } else if (password.contains(RegExp(mediumPattern))) {
      _passwordEmoji = '🔥';
      _passwordLevel = 'Medium';
      notifyListeners();
    } else if (!password.contains(RegExp(strongPattern))) {
      _passwordEmoji = '😢';
      _passwordLevel = 'Weak';
      notifyListeners();
    }
  }

  Future userLogin(
      {required String usrename,
      required BuildContext context,
      required String userpassword}) async {
    try {
      String token = "";
      await ReadCache.getString(key: AppKeys.token).then((value) {
        if (value != null) token = value;
      });

      if (token == "") {
        String? tonkenNew = await _authenticationAPI.authenticate();
        if (tonkenNew == null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
              text: 'Lỗi không kết nói được server vui lòng liên hệ quản trị',
              context: context));
          return;
        } else
          // ignore: curly_braces_in_flow_control_structures
          token = tonkenNew;
      }
      if (token != "") {
        var data = await _authenticationAPI.userLogin(
            usrename: usrename, userpassword: userpassword, token: token);
        if (data['responseCode'] == 0) {
          var id = data['body']['studentID'];
          // ignore: unused_local_variable
          var username = data['body']['username'];
          StudentNotifier sv =
              Provider.of<StudentNotifier>(context, listen: false);
          var result = await sv.getInfo(
              studentID: id,
              username: username,
              token: token,
              context: context);
          if (result) {
            await WriteCache.setInt(key: AppKeys.studentID, value: id)
                .whenComplete(() {
              WriteCache.setString(key: AppKeys.username, value: username)
                  .whenComplete(() {
                WriteCache.setString(key: AppKeys.token, value: token)
                    .whenComplete(
                  () => Navigator.of(context)
                      .pushReplacementNamed(AppRouter.homeRoute),
                );
              });
            });
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
              text: data['responseDesc'], context: context));
        }
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future authenticate(
    BuildContext context,
  ) async {
    try {
      String? tonken = await _authenticationAPI.authenticate();
      if (tonken == null) {
        toggleerroAuthen();
      } else {
        WriteCache.setString(key: AppKeys.token, value: tonken).whenComplete(
          () =>
              Navigator.of(context).pushReplacementNamed(AppRouter.loginRoute),
        );
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
