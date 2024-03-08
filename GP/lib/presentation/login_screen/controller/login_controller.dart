import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isError = false.obs;

  void toggleShowPassword() {
    // Toggle the value of isShowPassword
    isShowPassword.value = !isShowPassword.value;
  }

  String get eyeImage =>
      isShowPassword.value ? ImageConstant.closedEye : ImageConstant.imgPasseye;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
