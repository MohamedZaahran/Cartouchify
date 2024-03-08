import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/register_screen/models/register_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the RegisterScreen.
///
/// This class manages the state of the RegisterScreen, including the
/// current registerModelObj
class RegisterController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  Rx<RegisterModel> registerModelObj = RegisterModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;
  void toggleShowPassword() {
    // Toggle the value of isShowPassword
    isShowPassword.value = !isShowPassword.value;
  }

  void toggleShowPassword1() {
    // Toggle the value of isShowPassword
    isShowPassword1.value = !isShowPassword1.value;
  }

  String get eyeImage =>
      isShowPassword.value ? ImageConstant.closedEye : ImageConstant.imgPasseye;
  String get eyeImage1 => isShowPassword1.value
      ? ImageConstant.closedEye
      : ImageConstant.imgPasseye;
  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }
}
