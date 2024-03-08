import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'controller/login_controller.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/core/utils/validation_functions.dart';
import 'package:hierosecret/widgets/custom_elevated_button.dart';
import 'package:hierosecret/widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorMessage;

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
                      onFieldSubmitted: (_) =>
                          _formKey.currentState?.validate(),
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
                              controller.toggleShowPassword();
                              (context as Element).markNeedsBuild();
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 9.h),
                              child: Obx(() => SvgPicture.asset(
                                    controller.eyeImage,
                                    height: 37.v,
                                    width: 30.h,
                                  )),
                            ),
                          ),
                          suffixConstraints: BoxConstraints(maxHeight: 50.v),
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
    // Reset error message
    _errorMessage = null;

    final email = controller.emailController.text.trim();
    final password = controller.passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _errorMessage = "Email or password is empty";
      _showErrorSnackbar();
      return;
    }

    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        User user = userCredential.user!;

        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          // User is verified and exists in the "users" collection
          String fullName = userDoc['fullName'];
          String userID = user.uid;
          ; // Assuming the field in Firestore is named 'fullName'

          // Pass the full name to the next screen
          Get.offNamed(AppRoutes.homeOnboardingScreen,
              arguments: {"fullName": fullName, "userID": userID});
          return;
        } else {
          _errorMessage = "Wrong email or password";
          _showErrorSnackbar();
          return;
        }
      } on FirebaseAuthException catch (e) {
        _errorMessage = "Wrong email or password";
        _showErrorSnackbar();
        return;
      } catch (e) {
        _errorMessage = "Wrong email or password";
      }
    }

    _errorMessage = "Wrong email or password";
    _showErrorSnackbar();
  }

  void _showErrorSnackbar() {
    if (_errorMessage != null) {
      Get.snackbar(
        "Error",
        _errorMessage!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.only(bottom: 10.v, left: 10.h, right: 10.h),
      );
    }
  }
}
