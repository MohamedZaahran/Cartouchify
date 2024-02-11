// login_screen.dart
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/login_controller.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/core/utils/validation_functions.dart';
import 'package:hierosecret/widgets/custom_elevated_button.dart';
import 'package:hierosecret/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Add this import

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            image: DecorationImage(
              image: AssetImage(ImageConstant.imgOnboarding),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 46.h, top: 118.v, right: 46.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      ImageConstant.imgNounEgypt22733,
                      height: 201.v,
                      width: 179.h,
                    ),
                    SizedBox(height: 10.v),
                    Text("lbl_welcome_back".tr,
                        style: theme.textTheme.headlineMedium),
                    SizedBox(height: 4.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_e_mail".tr,
                          style: CustomTextStyles.titleMedium18),
                    ),
                    SizedBox(height: 1.v),
                    CustomTextFormField(
                      controller: controller.emailController,
                      hintText: "msg_enter_your_e_mail".tr,
                      textInputType: TextInputType.emailAddress,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(15.h, 5.v, 18.h, 1.v),
                        child: SvgPicture.asset(
                          ImageConstant.imgNouncontemporaryliterature51817621,
                          height: 44.v,
                          width: 35.h,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(maxHeight: 50.v),
                      textStyle: TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null ||
                            (!isValidEmail(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_email".tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 2.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_password".tr,
                          style: CustomTextStyles.titleMedium18),
                    ),
                    SizedBox(height: 1.v),
                    Obx(() => CustomTextFormField(
                          controller: controller.passwordController,
                          hintText: "msg_enter_your_password".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: controller.isShowPassword.value,
                          prefix: Container(
                            margin: EdgeInsets.symmetric(horizontal: 19.h),
                            child: SvgPicture.asset(
                              ImageConstant.imgSettings,
                              height: 32.v,
                              width: 28.h,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(maxHeight: 50.v),
                          textStyle: TextStyle(color: Colors.black),
                          suffix: InkWell(
                            onTap: () {
                              controller.isShowPassword.value =
                                  !controller.isShowPassword.value;
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 9.h),
                              child: SvgPicture.asset(
                                ImageConstant.imgPasseye,
                                height: 37.v,
                                width: 30.h,
                              ),
                            ),
                          ),
                          suffixConstraints: BoxConstraints(maxHeight: 50.v),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_password".tr;
                            }
                            return null;
                          },
                        )),
                    SizedBox(height: 5.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          onTapTxtForgotPassword();
                        },
                        child: Text("msg_forgot_password".tr,
                            style: theme.textTheme.titleMedium),
                      ),
                    ),
                    SizedBox(height: 35.v),
                    CustomElevatedButton(
                      text: "lbl_sign_in".tr,
                      onPressed: () {
                        // Handle Sign In
                        signInWithEmailAndPassword();
                      },
                    ),
                    SizedBox(height: 13.v),
                    GestureDetector(
                      onTap: () {
                        onTapTxtDonthaveanaccount();
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "msg_don_t_have_an_account2".tr,
                            style: CustomTextStyles.bodyLargeffc18553,
                          ),
                          TextSpan(text: " "),
                          TextSpan(
                            text: "lbl_sign_up".tr,
                            style:
                                CustomTextStyles.titleMediumff543855.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ]),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(AppRoutes.registerScreen);
  }

  onTapTxtForgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  Future<void> signInWithEmailAndPassword() async {
    final email = controller.emailController.text.trim();
    final password = controller.passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Handle the case where email or password is empty
      print("Email or password is empty");
      // You can display a snackbar or show an error message here
      return;
    }

    if (_formKey.currentState!.validate()) {
      try {
        print("Attempting to sign in with email: $email");

        UserCredential? userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential != null && userCredential.user != null) {
          User user = userCredential.user!;

          // Check if user's email is verified

          // User is verified, proceed with the user details
          print("Password: $password");
          print("User ID: ${user.uid}");
          print("Email: ${user.email}");
          try {
            Get.offNamed(AppRoutes.homeOnboardingScreen);
          } catch (e) {
            print("Exception during navigation: $e");
          }

          // Navigate to the home page
        } else {
          // Handle the case where the userCredential or user is null
          print("Authentication failed");
          // You can display a snackbar or show an error message here
        }
      } on FirebaseAuthException catch (e) {
        // Handle specific FirebaseAuthException
        print("Firebase Auth Exception: ${e.message}");
        // You can display a snackbar or show an error message here
      } catch (e) {
        // Handle other errors
        print("Login Error: $e");
        // You can display a snackbar or show an error message here
      }
    }
  }
}
