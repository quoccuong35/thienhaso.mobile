import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.keys.dart';

class CustomLoading {
  // ignore: non_constant_identifier_names
  static Widget Loading({required BuildContext context}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppKeys.bg), fit: BoxFit.cover)),
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 65.0,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 18.0),
                        child: Image.asset(AppKeys.logo, fit: BoxFit.fill)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Thiên Hà Số',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
            CircularProgressIndicator(
              color: AppColors.white,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 32),
              child: Text(
                "Đang Tải Dữ Liệu",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
