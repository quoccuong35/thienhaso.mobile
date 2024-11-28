import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

class CustomItemButton {
  static customItemButton(
      {VoidCallback? onTap,
      required String title,
      required IconData icons,
      required Color color}) {
    return InkWell(
      onTap: onTap!,
      child: Card(
        // margin: const EdgeInsets.only(right: 40.0),
        color: Colors.transparent,
        elevation: 0,
        // shadowColor: const Color.fromARGB(255, 19, 65, 83),
        margin: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            vSizedBox1,
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(
                  10,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45, // Shadow color
                    offset: Offset(0, 10), // Shadow position
                    blurRadius: 10.0, // Shadow blur radius
                    spreadRadius: 2.0, // Shadow spread radius
                  ),
                ],
              ),
              // ignore: sort_child_properties_last
              child: Icon(
                icons,
                size: 30,
                color: Colors.white,
              ),
              alignment: Alignment.center,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: CustomTextWidget.bodyTextS14W6(),
                  )),
            )
          ],
        ),
      ),
    );
  }

  static customItemButtonThongBao(
      {VoidCallback? onTap,
      required String title,
      required IconData icons,
      required Color color,
      required int soLuong}) {
    return InkWell(
      onTap: onTap!,
      child: Card(
        // margin: const EdgeInsets.only(right: 40.0),
        color: Colors.transparent,
        elevation: 0,
        // shadowColor: const Color.fromARGB(255, 19, 65, 83),
        margin: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            vSizedBox1,
            Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45, // Shadow color
                        offset: Offset(0, 10), // Shadow position
                        blurRadius: 10.0, // Shadow blur radius
                        spreadRadius: 2.0, // Shadow spread radius
                      ),
                    ],
                  ),
                  // ignore: sort_child_properties_last
                  child: Icon(
                    icons,
                    size: 30,
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Center(
                      child: Text(
                        soLuong.toString(), // Badge number
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: CustomTextWidget.bodyTextS14W6(),
                  )),
            )
          ],
        ),
      ),
    );
  }

  static customItemButtonHeader(
      {VoidCallback? onTap,
      required String title,
      required IconData icons,
      required Color color}) {
    return InkWell(
      onTap: onTap!,
      child: SizedBox(
        width: 90.0,
        height: 90.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 5.0,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45, // Shadow color
                      offset: Offset(0, 10), // Shadow position
                      blurRadius: 10.0, // Shadow blur radius
                      spreadRadius: 2.0, // Shadow spread radius
                    ),
                  ],
                ),
                // ignore: sort_child_properties_last
                child: Icon(
                  icons,
                  size: 30,
                  color: Colors.white,
                ),
                alignment: Alignment.center,
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: CustomTextWidget.bodyTextS14W6(),
                    )),
              )
            ]),
      ),
    );
  }
}
