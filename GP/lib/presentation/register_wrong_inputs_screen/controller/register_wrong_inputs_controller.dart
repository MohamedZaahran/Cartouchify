import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/register_wrong_inputs_screen/models/register_wrong_inputs_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the RegisterWrongInputsScreen.
///
/// This class manages the state of the RegisterWrongInputsScreen, including the
/// current registerWrongInputsModelObj
class RegisterWrongInputsController extends GetxController {
  TextEditingController createAccountFormController = TextEditingController();

  TextEditingController emailFormController = TextEditingController();

  TextEditingController passwordFormController = TextEditingController();

  TextEditingController confirmPasswordFormController = TextEditingController();

  Rx<RegisterWrongInputsModel> registerWrongInputsModelObj =
      RegisterWrongInputsModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  @override
  void onClose() {
    super.onClose();
    createAccountFormController.dispose();
    emailFormController.dispose();
    passwordFormController.dispose();
    confirmPasswordFormController.dispose();
  }
}
