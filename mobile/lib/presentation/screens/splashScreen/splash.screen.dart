import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/app/routers/app.routes.dart';
import 'package:mobile/core/notifiers/sinhvien.notifier.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _initiateCache() async {
    return await CacheManagerUtils.conditionalCache(
        key: AppKeys.userData,
        valueType: ValueType.StringValue,
        actionIfNull: () {
          Navigator.of(context).pushNamed(AppRouter.loginRoute);
        },
        actionIfNotNull: () async {
          await SetSinhVien();
          Navigator.of(context).pushNamed(AppRouter.homeRoute);
        });
  }

  Future<void> SetSinhVien() async {
    SinhVienNotifier sv = Provider.of<SinhVienNotifier>(context, listen: false);
    sv.setSinhVien();
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
                        offset: Offset(0, 10))
                  ],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/logo.png",
                      ))),
            ),
            vSizedBox1,
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Hệ thống đang khởi động vui lòng đợi',
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w600, color: AppColors.white),
                  speed: const Duration(milliseconds: 50),
                ),
                // TypewriterAnimatedText('Hệ thống đang khởi động vui lòng đợi',
                //     textStyle: TextStyle(
                //         fontWeight: FontWeight.w600, color: AppColors.white),
                //     speed: const Duration(milliseconds: 50)),
              ],
              totalRepeatCount: 100,
            ),
          ],
        ),
      ),
    );
  }
}
