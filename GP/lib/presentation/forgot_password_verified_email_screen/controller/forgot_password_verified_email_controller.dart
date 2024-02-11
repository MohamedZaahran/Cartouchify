import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/forgot_password_verified_email_screen/models/forgot_password_verified_email_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ForgotPasswordVerifiedEmailScreen.
///
/// This class manages the state of the ForgotPasswordVerifiedEmailScreen, including the
/// current forgotPasswordVerifiedEmailModelObj
class ForgotPasswordVerifiedEmailController extends GetxController {
  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  Rx<ForgotPasswordVerifiedEmailModel> forgotPasswordVerifiedEmailModelObj =
      ForgotPasswordVerifiedEmailModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  @override
  void onClose() {
    super.onClose();
    newpasswordController.dispose();
    confirmpasswordController.dispose();
  }
}
