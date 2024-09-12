import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/presentation/widgets/custom.text.style.dart';
// ignore: unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget welcomeTextLogin(
    {required bool themeFlag, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            AppLocalizations.of(context)!.lgTieuDe1,
            style: CustomTextWidget.bodyTextB1(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
        ),
        Center(
          child: Text(
            AppLocalizations.of(context)!.lgTieuDe2,
            style: CustomTextWidget.bodyTextB1(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
        ),
      ],
    ),
  );
}
