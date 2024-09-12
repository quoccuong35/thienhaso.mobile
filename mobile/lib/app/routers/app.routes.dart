import 'package:flutter/material.dart';
import 'package:mobile/presentation/screens/bangdiemScreen/bangdiem.screen.dart';
import 'package:mobile/presentation/screens/diemdanhScreen/diemdanhmonhoc.screen.dart';
import 'package:mobile/presentation/screens/diemdanhScreen/diemdanhtonghop.screen.dart';
import 'package:mobile/presentation/screens/quenmatkhauScreen/quenmatkhau.screen.dart';
import 'package:mobile/presentation/screens/sinhvienScreen/main.sinhvien.screen.dart';
import 'package:mobile/presentation/screens/sinhvienScreen/widgets/doimatkhau.widget.dart';
import 'package:mobile/presentation/screens/splashScreen/splash.screen.dart';
import 'package:mobile/presentation/screens/thoikhoabieuScreen/thoikhoabieu.screen.dart';
import '../../presentation/screens/homeScreen/home.screen.dart';
import '../../presentation/screens/loginScreen/login.view.dart';

class AppRouter {
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signup";
  static const String splashRoute = "/splash";
  static const String homeRoute = "/home";
  static const String bangDiem = "/bangDiem";
  static const String diemDanhTongHop = "/diemDanhTongHop";
  static const String diemDanhMonHoc = "/diemDanhMonHoc";
  static const String accountInfo = "/accountInfo";
  static const String changePassRoute = "/changePassword";
  static const String quenmatkhauRoute = "/quenmatkhauRoute";
  static const String appSettingsRoute = "/appSettings";
  static const String mainSinhVienScreen = "/mainSinhVienScreen";
  static const String doiMatKhau = "/doiMatKhau";
  static const String thoiKhoaBieu = "/thoiKhoaBieu";
  static const String diemDanhMonHocChiTiet = "/diemDanhMonHocChiTiet";

  // ignore: body_might_complete_normally_nullable
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          );
        }
      case loginRoute:
        {
          return MaterialPageRoute(
            builder: (_) => LoginScreen(),
          );
        }
      case quenmatkhauRoute:
        {
          return MaterialPageRoute(
            builder: (_) => ForgotPasswordScreen(),
          );
        }
      case bangDiem:
        {
          return MaterialPageRoute(
            builder: (_) => const BangDiemScreen(),
          );
        }
      case mainSinhVienScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const MainSinhVienScreen(),
          );
        }
      case doiMatKhau:
        {
          return MaterialPageRoute(
            builder: (_) => DoiMatKhau(),
          );
        }
      case diemDanhTongHop:
        {
          return MaterialPageRoute(
            builder: (_) => const DiemDanhTongHopScreen(),
          );
        }
      case diemDanhMonHoc:
        {
          return MaterialPageRoute(
            builder: (_) => const DiemDanhMonHocScreen(),
          );
        }
      case splashRoute:
        {
          return MaterialPageRoute(
            fullscreenDialog: false,
            builder: (_) => const SplashScreen(),
          );
        }
      case thoiKhoaBieu:
        {
          return MaterialPageRoute(
            fullscreenDialog: false,
            builder: (_) => ThoiKhoaBieuScreen(),
          );
        }
    }
  }
}
