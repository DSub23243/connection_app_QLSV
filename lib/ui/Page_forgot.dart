import 'package:connection/providers/forgotviewmodel.dart';
import 'package:connection/ui/AppConstant.dart';
import 'package:connection/ui/custom_control.dart';
import 'package:connection/ui/page_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageForgot extends StatelessWidget {
  static String routename = '/Forgot';
  PageForgot({super.key});
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<ForgotViewmodel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: viewmodel.status == 3
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('./img/tick.gif'),
                        width: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Gửi thành công. Xác nhận qua Email của bạn",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Đăng nhập. "),
                          GestureDetector(
                            onTap: () {
                              viewmodel.status = 0;
                              Navigator.popAndPushNamed(
                                  context, pageLogin.routename);
                            },
                            child: Text(
                              "Tại đây",
                              style: AppConstant.Textlink,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              : Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppLogo_Forgot(),
                          const SizedBox(
                            height: 60,
                          ),
                          const Text("Điền email của bạn!"),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                              textController: _emailController,
                              hintText: "Email",
                              obscureText: false),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            viewmodel.errormessage,
                            style: AppConstant.texterror,
                          ),
                          GestureDetector(
                            onTap: () {
                              final email = _emailController.text.trim();
                              viewmodel.forgotPassword(email);
                            },
                            child: const CustomButton(textButton: "Gửi"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .popAndPushNamed(pageLogin.routename),
                            child: Text(
                              "Quay lại",
                              style: AppConstant.Textlink,
                            ),
                          ),
                        ],
                      ),
                    ),
                    viewmodel.status == 1
                        ? CustomSpinner(size: size)
                        : Container(),
                  ],
                ),
        ),
      ),
    );
  }
}
