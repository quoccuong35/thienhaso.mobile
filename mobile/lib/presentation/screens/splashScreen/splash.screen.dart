// ignore_for_file: use_build_context_synchronously, curly_braces_in_flow_control_structures

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/app/routers/app.routes.dart';
import 'package:mobile/core/notifiers/authentication.notifer.dart';

import 'package:mobile/core/notifiers/student.notifer.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _initiateCache() async {
    return await CacheManagerUtils.conditionalCache(
        key: AppKeys.token,
        valueType: ValueType.StringValue,
        actionIfNull: () async {
          await Authenticate();
        },
        actionIfNotNull: () async {
          await setSinhVien();
        });
  }

  // ignore: non_constant_identifier_names
  Future<void> Authenticate() async {
    AuthenticationNotifier authen =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    authen.authenticate(context);
  }

  Future<void> setSinhVien() async {
    int studentID = 0;
    String token = "";
    String username = "";
    await ReadCache.getString(key: AppKeys.token).then((value) {
      if (value != null) {
        token = value;
      }
    });
    await ReadCache.getInt(key: AppKeys.studentID).then((value) {
      if (value != null) {
        studentID = value;
      }
    });
    await ReadCache.getString(key: AppKeys.username).then((value) {
      if (value != null) {
        username = value;
      }
    });
    if (studentID > 0 && token != "" && username != "") {
      StudentNotifier sv = Provider.of<StudentNotifier>(context, listen: false);
      var result = await sv.getInfo(
          studentID: studentID,
          username: username,
          token: token,
          context: context);
      if (result) {
        Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute);
      } else
        Navigator.of(context).pushReplacementNamed(AppRouter.loginRoute);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRouter.loginRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _initiateCache();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppKeys.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              margin: const EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: AppColors.white),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: AppColors.white.withOpacity(0.5),
                        offset: const Offset(0, 10))
                  ],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/logo.png",
                      ))),
            ),
            vSizedBox1,
            Consumer<AuthenticationNotifier>(
              builder: (context, authen, _) {
                return authen.erroAuthen
                    ? const Center(
                        child: Text(
                            "Lỗi không kết nói được server vui lòng liên hệ quản trị"))
                    : AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Hệ thống đang khởi động vui lòng đợi',
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.white),
                            speed: const Duration(milliseconds: 50),
                          ),
                          // TypewriterAnimatedText('Hệ thống đang khởi động vui lòng đợi',
                          //     textStyle: TextStyle(
                          //         fontWeight: FontWeight.w600, color: AppColors.white),
                          //     speed: const Duration(milliseconds: 50)),
                        ],
                        totalRepeatCount: 100,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
