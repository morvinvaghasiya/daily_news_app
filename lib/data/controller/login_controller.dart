import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> passWordController = TextEditingController().obs;
  RxBool shownameerror = true.obs;
  RxBool passWordError = true.obs;
}
