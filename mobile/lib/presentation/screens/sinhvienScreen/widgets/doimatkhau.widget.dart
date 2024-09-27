import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/core/notifiers/authentication.notifer.dart';
import 'package:mobile/core/notifiers/theme.notifier.dart';
import 'package:mobile/core/utils/snackbar.util.dart';
import 'package:mobile/presentation/screens/sinhvienScreen/widgets/text.doimatkhau.widget.dart';
import 'package:mobile/presentation/widgets/custom.animated.container.dart';
import 'package:mobile/presentation/widgets/custom.appbar.dart';
import 'package:mobile/presentation/widgets/custom.text.field.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:provider/provider.dart';

class DoiMatKhau extends StatelessWidget {
  DoiMatKhau({super.key});
  final TextEditingController controllerMatKhauCu = TextEditingController();
  final TextEditingController controllerMatKhauMoi = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    AuthenticationNotifier authNotifier(bool renderUI) =>
        Provider.of<AuthenticationNotifier>(context, listen: renderUI);
    guiYeuCau() {
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
            text: 'Gửi yêu cầu thành công mật khẩu của bạn đã được đổi',
            context: context));
      }
    }

    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,

          resizeToAvoidBottomInset: false,
          appBar: CustomAppbar("Đổi mật khẩu", context),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextDoiMatKhau(themeFlag: themeFlag),
                    vSizedBox1,
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                            child: CustomTextField.customTextField(
                              textEditingController: controllerMatKhauCu,
                              obscureText: true,
                              hintText: 'Mật khẩu hiện tại',
                              validator: (val) => val!.isEmpty
                                  ? 'Mật khẩu hiện tại chưa nhập'
                                  : null,
                            ),
                          ),
                          vSizedBox1,
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                            child: Consumer<AuthenticationNotifier>(
                                builder: (context, notifier, _) {
                              return TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: AppFonts.contax,
                                ),
                                obscureText: notifier.obscureText,
                                controller: controllerMatKhauMoi,
                                validator: (val) => val!.isEmpty
                                    ? 'Mật khẩu mới chưa nhập'
                                    : null,
                                onChanged: (val) {
                                  authNotifier(false)
                                      .checkPasswordStrength(password: val);
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  hintText: "Mật khẩu mới",
                                  hintStyle: TextStyle(
                                    color: AppColors.primary,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    borderSide: BorderSide(
                                      width: 1.5,
                                    ),
                                  ),
                                  suffix: InkWell(
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      color: AppColors.bluedark,
                                    ),
                                    onTap: () => {notifier.changeObscureText()},
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    borderSide:
                                        BorderSide(color: AppColors.rawSienna),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    vSizedBox1,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(authNotifier(true).passwordEmoji!),
                              hSizedBox1,
                              if (authNotifier(true).passwordLevel! == 'Weak')
                                CustomAnimatedContainer.customAnimatedContainer(
                                  height: 10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.10,
                                  context: context,
                                  color: Colors.red,
                                  curve: Curves.easeIn,
                                ),
                              if (authNotifier(true).passwordLevel! == 'Medium')
                                CustomAnimatedContainer.customAnimatedContainer(
                                  height: 10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  context: context,
                                  color: Colors.blue,
                                  curve: Curves.easeIn,
                                ),
                              if (authNotifier(true).passwordLevel! == 'Strong')
                                CustomAnimatedContainer.customAnimatedContainer(
                                  height: 10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.70,
                                  context: context,
                                  color: Colors.green,
                                  curve: Curves.easeIn,
                                ),
                            ],
                          ),
                          if (authNotifier(true).passwordLevel! == 'Weak')
                            const Text("Mật khẩu yếu")
                          else if (authNotifier(true).passwordLevel! ==
                              'Medium')
                            const Text("Mật khẩu vừa phải")
                          else if (authNotifier(true).passwordLevel! ==
                              'Strong')
                            const Text("Mật khẩu bảo mật tốt")
                        ],
                      ),
                    ),
                    vSizedBox2,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                      child: MaterialButton(
                        height: MediaQuery.of(context).size.height * 0.07,
                        minWidth: MediaQuery.of(context).size.width,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          guiYeuCau();
                        },
                        color: AppColors.primary,
                        child: const Text(
                          'Gửi yêu cầu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppFonts.fontSize16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          // bottomNavigationBar: CustomFootder(),
        ));
  }
}
