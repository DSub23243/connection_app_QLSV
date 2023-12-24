import 'package:connection/ui/AppConstant.dart';
import 'package:connection/ui/Page_forgot.dart';
import 'package:connection/ui/page_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/loginviewmodel.dart';
import 'custom_control.dart';
import 'page_main.dart';

class pageLogin extends StatelessWidget {
  pageLogin({super.key});
  static String routename = '/login';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<loginViewModel>(context);
    final size = MediaQuery.of(context).size;
    if (viewmodel.status == 3) {
      Future.delayed(
        Duration.zero,
        () {
          Navigator.popAndPushNamed(context, PageMain.routename);
        },
      );
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 249, 229, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppLogo(),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Xin chào",
                        style: AppConstant.textfancyheader,
                      ),
                      Text(
                        "Đã lâu không gặp bạn",
                        style: AppConstant.textfancyheader_two,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        hintText: "Username",
                        textController: _emailController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                          hintText: "Password",
                          textController: _passwordController,
                          obscureText: true),
                      const SizedBox(
                        height: 20,
                      ),
                      viewmodel.status == 2
                          ? Text(
                              viewmodel.errorMessage,
                              style: TextStyle(color: Colors.red[600]),
                            )
                          : const Text(""),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          String username = _emailController.text.trim();
                          String password = _passwordController.text.trim();
                          viewmodel.login(username, password);
                        },
                        child: const CustomButton(
                          textButton: "Đăng nhập",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Chưa có tài khoản?",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .popAndPushNamed(PageRegister.routename),
                            child: Text(
                              "Đăng ký",
                              style: AppConstant.Textlink,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .popAndPushNamed(PageForgot.routename),
                        child: Text(
                          "Quên mật khẩu?",
                          style: AppConstant.Textlink,
                        ),
                      )
                    ],
                  ),
                ),
                viewmodel.status == 1 ? CustomSpinner(size: size) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
