import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.fonts.dart';
import 'package:mobile/core/notifiers/theme.notifier.dart';
import 'package:mobile/core/utils/snackbar.util.dart';
import 'package:mobile/presentation/screens/quenmatkhauScreen/widget/quenmatkhau.widget.dart';
import 'package:mobile/presentation/widgets/custom.appbar.dart';
import 'package:mobile/presentation/widgets/custom.text.field.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController controllerMaSV = TextEditingController();
  final TextEditingController controllerHoVaTen = TextEditingController();
  final TextEditingController controllerLop = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    guiYeuCau() {
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
            text:
                'Gửi yêu cầu thành công mật khẩu đã được gửi qua mail của bạn',
            context: context));
      }
    }

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppbar("Quên Mật Khẩu", context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextQuenMatKhau(themeFlag: themeFlag),
            vSizedBox1,
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
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                            textEditingController: controllerMaSV,
                            obscureText: false,
                            hintText: 'Mã sinh viên',
                            validator: (val) =>
                                val!.isEmpty ? 'Mã sinh viên chưa nhập' : null,
                          ),
                        ),
                        vSizedBox1,
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                            textEditingController: controllerHoVaTen,
                            obscureText: false,
                            hintText: 'Họ và tên',
                            validator: (val) =>
                                val!.isEmpty ? 'Họ và tên chưa nhập' : null,
                          ),
                        ),
                        vSizedBox1,
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                            textEditingController: controllerLop,
                            obscureText: false,
                            hintText: 'Lớp',
                            validator: (val) =>
                                val!.isEmpty ? 'Lớp chưa nhập' : null,
                          ),
                        ),
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
      ),
    );
  }
}
