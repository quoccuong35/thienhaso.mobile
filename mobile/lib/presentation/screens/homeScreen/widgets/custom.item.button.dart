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
        color: const Color.fromARGB(255, 235, 241, 243),
        shadowColor: const Color.fromARGB(255, 19, 65, 83),
        margin: const EdgeInsets.all(5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              vSizedBox1,
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
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

  static customItemButtonHeader(
      {VoidCallback? onTap,
      required String title,
      required IconData icons,
      required Color color}) {
    return InkWell(
      onTap: onTap!,
      child: Card(
          // margin: const EdgeInsets.only(right: 40.0),
          color: const Color.fromARGB(255, 235, 241, 243),
          shadowColor: const Color.fromARGB(255, 19, 65, 83),
          margin: const EdgeInsets.all(5.0),
          child: SizedBox(
            width: 110.0,
            height: 110.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
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
          )),
    );
  }
}
