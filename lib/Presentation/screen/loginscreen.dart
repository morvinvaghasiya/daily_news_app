import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/login_controller.dart';
import '../widget/custombutton.dart';
import '../widget/labeltext.dart';
import '../widget/textfield.dart';
import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            "Daily News App",
            style: TextStyle(
              fontSize: size.width * 0.09,
              fontWeight: FontWeight.bold,
              color: const Color(0xff7657DE),
            ),
          ),
          // Expanded(child: Container()),
          SizedBox(
            height: size.height * 0.2,
          ),

          Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ],
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Login Screen",
                    style: TextStyle(
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                LabelText(size: size, name: "Username"),
                CustomTextFild(
                  size: size,
                  hint: "Username",
                  controller: controller.nameController.value,
                ),
                Obx(
                  () => controller.shownameerror.value
                      ? Container()
                      : Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              "Please Enter your Username",
                              style: TextStyle(
                                fontSize: size.width * 0.03,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                LabelText(size: size, name: "Password"),
                CustomTextFild(
                  size: size,
                  hint: "Password",
                  controller: controller.passWordController.value,
                ),
                Obx(
                  () => controller.passWordError.value
                      ? Container()
                      : Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              "Please Enter your password",
                              style: TextStyle(
                                fontSize: size.width * 0.03,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                CustomButton(
                    size: size,
                    func: () {
                      setState(() {
                        if (controller.nameController.value.text.isNotEmpty &&
                            controller
                                .passWordController.value.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HomeScreen(),
                            ),
                          );
                        } else {
                          if (controller.nameController.value.text.isEmpty &&
                              controller
                                  .passWordController.value.text.isEmpty) {
                            controller.shownameerror.value = false;
                            controller.passWordError.value = false;
                          } else {
                            if (controller.nameController.value.text.isEmpty) {
                              controller.shownameerror.value = false;
                            } else {
                              controller.passWordError.value = false;
                            }
                          }
                        }
                      });
                    },
                    txt: "LOGIN"),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
