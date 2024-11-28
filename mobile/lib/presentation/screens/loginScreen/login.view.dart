// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/app/routers/app.routes.dart';
import 'package:mobile/core/notifiers/authentication.notifer.dart';
import 'package:mobile/core/notifiers/lang.notifiers.dart';
import 'package:mobile/core/notifiers/theme.notifier.dart';
import 'package:mobile/presentation/screens/loginScreen/widget/welcome.login.widget.dart';
import 'package:mobile/presentation/widgets/custom.text.field.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    userLogin() {
      if (_formKey.currentState!.validate()) {
        var authNotifier =
            Provider.of<AuthenticationNotifier>(context, listen: false);

        authNotifier.userLogin(
            context: context,
            usrename: userEmailController.text,
            userpassword: userPassController.text);
      }
    }
    // ignore: no_leading_underscores_for_local_identifiers\

    // ignore: no_leading_underscores_for_local_identifiers
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);

    var themeFlag = _themeNotifier.darkTheme;
    return PopScope(
        canPop: false,
        child: SafeArea(
            top: false,
            child: Consumer2<LangNotifiers, AuthenticationNotifier>(
                builder: (context, lang, authen, _) {
              return Scaffold(
                appBar: AppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 200.0,
                    flexibleSpace: Container(
                        height: 200.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppKeys.bg), fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          color: Colors.blue,
                        )),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                            child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 4, color: AppColors.white),
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
                                    AppKeys.logo,
                                  ))),
                        )),
                        vSizedBox3
                      ],
                    )),
                body: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      children: [
                        welcomeTextLogin(
                            themeFlag: themeFlag, context: context),
                        vSizedBox2,
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35.0, 0.0, 35.0, 2.0),
                                      child: CustomTextField.customTextField(
                                        textEditingController:
                                            userEmailController,
                                        obscureText: false,
                                        hintText: AppLocalizations.of(context)!
                                            .taiKhoan,
                                        validator: (val) => val!.isEmpty
                                            ? AppLocalizations.of(context)!
                                                .required(AppLocalizations.of(
                                                        context)!
                                                    .taiKhoan)
                                            : null,
                                      ),
                                    ),
                                    vSizedBox1,
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35.0, 0.0, 35.0, 2.0),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: AppFonts.contax,
                                        ),
                                        obscureText: authen.obscureText,
                                        controller: userPassController,
                                        validator: (val) => val!.isEmpty
                                            ? AppLocalizations.of(context)!
                                                .required(AppLocalizations.of(
                                                        context)!
                                                    .matKhau)
                                            : null,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 30, vertical: 20),
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .matKhau,
                                          hintStyle: TextStyle(
                                            color: AppColors.primary,
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                            borderSide: BorderSide(
                                              width: 1.5,
                                            ),
                                          ),
                                          suffix: InkWell(
                                            child: Icon(
                                              Icons.lock_sharp,
                                              color: AppColors.bluedark,
                                            ),
                                            onTap: () =>
                                                {authen.changeObscureText()},
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                            borderSide: BorderSide(
                                                color: AppColors.rawSienna),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              vSizedBox2,
                              !authen.login
                                  ? Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35.0, 0.0, 35.0, 2.0),
                                      child: MaterialButton(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        minWidth:
                                            MediaQuery.of(context).size.width,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        onPressed: () async {
                                          userLogin();
                                        },
                                        color: AppColors.primary,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.login,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .dangNhap,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: AppFonts.fontSize16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35.0, 0.0, 35.0, 2.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12)),
                                          color: AppColors.primary,
                                        ),
                                        child: Row(
                                          children: [
                                            hSizedBox1,
                                            CircularProgressIndicator(
                                              color: AppColors.white,
                                            ),
                                            hSizedBox1,
                                            const Text(
                                                "Đang đăng nhập vui lòng đợi",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: AppFonts.fontSize16,
                                                  fontWeight: FontWeight.w600,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        vSizedBox2,
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context)
                                    .pushNamed(AppRouter.quenmatkhauRoute),
                                child: Text(
                                  AppLocalizations.of(context)!.quenMatKhau,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: themeFlag
                                        ? AppColors.creamColor
                                        : AppColors.mirage,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Text(
                                "App version 1.0.0",
                                style: TextStyle(
                                  color: themeFlag
                                      ? AppColors.creamColor
                                      : AppColors.mirage,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        vSizedBox3,
                        const Center(
                          child: Text("ThienHaSo.com"),
                        )
                      ],
                    )),
                  ],
                ),
              );
            })));
  }
}
