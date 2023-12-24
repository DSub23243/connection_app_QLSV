import 'package:connection/models/profile.dart';
import 'package:connection/providers/registerviewmodel.dart';
import 'package:connection/ui/AppConstant.dart';
import 'package:connection/ui/custom_control.dart';
import 'package:connection/ui/page_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_main.dart';

// ignore: must_be_immutable
class PageRegister extends StatelessWidget {
  PageRegister({super.key});
  static String routename = '/register';
  final _usernameController = TextEditingController();
  final _emailnameController = TextEditingController();
  final _pass1nameController = TextEditingController();
  final _pass2nameController = TextEditingController();
  bool agree = true;
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<RegisterViewModel>(context);
    final size = MediaQuery.of(context).size;
    final profile = Profile();
    if (profile.token != "") {
      //check login
      Future.delayed(
        Duration.zero,
        () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageMain(),
              ));
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 249, 229, 1),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: viewmodel.status == 3 || viewmodel.status == 4
              ? Column(
                  children: [
                    const Image(
                      image: AssetImage('./img/tick.gif'),
                      width: 100,
                    ),
                    Text(
                      "Chúc mừng đăng ký thành công",
                      style: AppConstant.textfancyheader,
                    ),
                    viewmodel.status == 3
                        ? const Text(
                            "Bạn cần xác nhận Email đẻ hoàn thành đăng ký!")
                        : const Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Đăng nhập. "),
                        GestureDetector(
                          onTap: () => Navigator.popAndPushNamed(
                              context, pageLogin.routename),
                          child: Text(
                            "Tại đây",
                            style: AppConstant.Textlink,
                          ),
                        )
                      ],
                    )
                  ],
                )
              : Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppLogo(),
                            Text(
                              "Please enter information",
                              style: AppConstant.textfancyheader,
                            ),
                            Text(
                              "Điền thông tin yêu cầu nào!",
                              style: AppConstant.textfancyheader_two,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                                textController: _emailnameController,
                                hintText: 'Email',
                                obscureText: false),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                textController: _usernameController,
                                hintText: 'User',
                                obscureText: false),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                textController: _pass1nameController,
                                hintText: 'Password',
                                obscureText: true),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                textController: _pass2nameController,
                                hintText: 'Re-Password',
                                obscureText: true),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              viewmodel.errormessage,
                              style: AppConstant.texterror,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: viewmodel.agree,
                                  onChanged: (value) {
                                    viewmodel.setAgree(value!);
                                  },
                                ),
                                const Text(
                                  "Bạn đồng ý với điều khoản của chúng tôi. ",
                                  style: TextStyle(fontSize: 13),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text(
                                          'Quy định',
                                        ),
                                        content: SingleChildScrollView(
                                            child: Text(viewmodel.quydinh)),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Quy định',
                                    style: AppConstant.Textlink,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  final email =
                                      _emailnameController.text.trim();
                                  final username =
                                      _usernameController.text.trim();
                                  final pass1 =
                                      _pass1nameController.text.trim();
                                  final pass2 =
                                      _pass2nameController.text.trim();
                                  viewmodel.register(
                                      email, username, pass1, pass2);
                                },
                                child:
                                    const CustomButton(textButton: 'Đăng ký')),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .popAndPushNamed(pageLogin.routename),
                              child: Text(
                                "Đăng nhập",
                                style: AppConstant.Textlink,
                              ),
                            ),
                          ]),
                    ),
                    viewmodel.status == 1
                        ? CustomSpinner(size: size)
                        : Container(),
                  ],
                ),
        ),
      )),
    );
  }
}
