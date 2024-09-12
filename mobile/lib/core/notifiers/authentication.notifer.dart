// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile/core/models/data/datas.dart';
import 'package:mobile/core/models/sinhvien.dart';
import 'package:mobile/core/notifiers/sinhvien.notifier.dart';
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

  bool _autoLogin = false;
  bool get autoLogin => _autoLogin;

  void changeObscureText() {
    _obscureText = !_obscureText;
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

  Future createAccount(
      {required String useremail,
      required BuildContext context,
      required String username,
      required String userpassword}) async {
    try {
      var userData = await _authenticationAPI.createAccount(
          useremail: useremail, username: username, userpassword: userpassword);
      print(userData);

      final Map<String, dynamic> parseData = await jsonDecode(userData);
      bool isAuthenticated = parseData['authentication'];
      dynamic authData = parseData['data'];

      if (isAuthenticated) {
        WriteCache.setString(key: AppKeys.userData, value: authData)
            .whenComplete(
          () => Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackUtil.stylishSnackBar(text: authData, context: context));
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    } catch (e) {
      print(e);
    }
  }

  Future userLogin(
      {required String usrename,
      required BuildContext context,
      required String userpassword}) async {
    try {
      if (AppKeys.noApi) {
        var user = Datas.item.firstWhere((o) => o.masv == usrename,
            orElse: () => SinhVien.enty());

        if (user.masv != '') {
          WriteCache.setString(key: AppKeys.userData, value: user.masv)
              .whenComplete(() {
            Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute);
            SinhVienNotifier sv =
                Provider.of<SinhVienNotifier>(context, listen: false);
            sv.setSinhVien();
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
              text: "Tài khoản hoặc mật khẩu không đúng", context: context));
        }
        // Future.delayed(const Duration(seconds: 2), () {

        //   // deleayed code here
        // });
      }

      // var userData = await _authenticationAPI.userLogin(
      //     usrename: usrename, userpassword: userpassword);
      // print(userData);
      // final Map<String, dynamic> parseData = await jsonDecode(userData);
      // bool isAuthenticated = parseData['authentication'];
      // dynamic authData = parseData['data'];

      // if (isAuthenticated) {
      //   WriteCache.setString(key: AppKeys.userData, value: authData)
      //       .whenComplete(
      //     () => Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute),
      //   );
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackUtil.stylishSnackBar(text: authData, context: context));
      // }
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
