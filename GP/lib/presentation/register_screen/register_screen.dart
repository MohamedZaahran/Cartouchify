import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'controller/register_controller.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/core/utils/validation_functions.dart';
import 'package:hierosecret/widgets/custom_elevated_button.dart';
import 'package:hierosecret/widgets/custom_text_form_field.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  RegisterScreen({Key? key}) : super(key: key);

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
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 34.h, vertical: 49.v),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 18.v),
                    SizedBox(
                      height: 228.v,
                      width: 241.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Create Account".tr,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ),
                          SvgPicture.asset(
                            ImageConstant.imgNounEgypt22733,
                            height: 201.v,
                            width: 179.h,
                            alignment: Alignment.topCenter,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.v),
                    SizedBox(
                      height: 75.v,
                      width: 301.h,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          _buildFullName(),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 4.h,
                              ),
                              child: Text(
                                "lbl_full_name".tr,
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: Text(
                          "lbl_e_mail".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ),
                    _buildEmail(),
                    SizedBox(height: 2.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: Text(
                          "lbl_password".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ),
                    _buildPassword(),
                    SizedBox(height: 2.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: Text(
                          "msg_confirm_password".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ),
                    _buildConfirmpassword(),
                    SizedBox(height: 31.v),
                    _buildSignUpButton(),
                    SizedBox(height: 14.v),
                    GestureDetector(
                      onTap: () {
                        onTapTxtAlreadyhavean();
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "msg_already_have_an2".tr,
                              style: CustomTextStyles.bodyLargeffc18553,
                            ),
                            TextSpan(text: " "),
                            TextSpan(
                              text: "lbl_sign_in".tr,
                              style:
                                  CustomTextStyles.titleMediumff543855.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    _buildNine(),
                    SizedBox(height: 10.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 24.h),
                              child: _buildSocialButton(
                                imagePath: ImageConstant.imgGroup16,
                                buttonHeight: 60.0.h,
                                buttonWidth: 59.0.v,
                                onPressed: () {
                                  // Handle Facebook registration
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.h, vertical: 5.v),
                              child: _buildSocialButton(
                                imagePath: ImageConstant.imgGroup15,
                                buttonHeight: 60.0.h,
                                buttonWidth: 59.0.v,
                                onPressed: () {
                                  // Handle Google registration
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: _buildSocialButton(
                                imagePath: ImageConstant.imgGroup14,
                                buttonHeight: 60.0.h,
                                buttonWidth: 59.0.v,
                                onPressed: () {
                                  // Handle Apple registration
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return CustomElevatedButton(
      text: "lbl_sign_up".tr,
      margin: EdgeInsets.symmetric(horizontal: 12.h),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          try {
            UserCredential userCredential =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: controller.emailController.text.trim(),
              password: controller.passwordController.text.trim(),
            );

            await FirebaseFirestore.instance
                .collection('users')
                .doc(userCredential.user!.uid)
                .set({
              'fullName': controller.fullNameController.text.trim(),
            });

            // Show success message in UI
            showSuccessMessage("Registration successful");
            Future.delayed(Duration(seconds: 2), () {
              Get.toNamed(AppRoutes.loginScreen);
            });

            // Navigate to the next screen or perform other actions
          } catch (e) {
            String errorMessage;
            if (e is FirebaseAuthException) {
              switch (e.code) {
                case 'email-already-in-use':
                  errorMessage = "The email address is already in use.";
                  break;
                case 'invalid-email':
                  errorMessage = "The email address is invalid.";
                  break;
                case 'weak-password':
                  errorMessage = "The password is too weak.";
                  break;
                default:
                  errorMessage = "please fill in the details";
              }
            } else {
              errorMessage = "An unexpected error occurred.";
            }

            print(errorMessage);

            // Show error message in Snackbar
            showErrorSnackbar(errorMessage);
          }
        }
      },
    );
  }

  void showErrorSnackbar(String errorMessage) {
    Get.snackbar(
      "Error",
      errorMessage,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void showSuccessMessage(String message) {
    Get.snackbar("Success", message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM);
  }

  Widget _buildFullName() {
    return CustomTextFormField(
      width: 301.h,
      controller: controller.fullNameController,
      hintText: "msg_enter_your_full".tr,
      alignment: Alignment.bottomCenter,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(15.h, 4.v, 15.h, 2.v),
        child: SvgPicture.asset(
          ImageConstant.imgNounpharoh3278201,
          height: 44.v,
          width: 35.h,
        ),
      ),
      prefixConstraints: BoxConstraints(maxHeight: 70.h, maxWidth: 70.v),
      textStyle: TextStyle(color: Colors.black),
    );
  }

  Widget _buildSocialButton({
    required String imagePath,
    required VoidCallback onPressed,
    double buttonHeight = 60.0,
    double buttonWidth = 59.0,
    double logoHeight = 60.0,
    double logoWidth = 59.0,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double scaleFactor =
            constraints.maxWidth / 115; // Adjust the reference width as needed

        return GestureDetector(
          onTap: onPressed,
          child: Container(
            height: buttonHeight * scaleFactor,
            width: buttonWidth * scaleFactor,
            padding: EdgeInsets.all(13.0 * scaleFactor),
            margin: EdgeInsets.only(bottom: 14.0 * scaleFactor),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 234, 234),
              borderRadius: BorderRadius.circular(15.0 * scaleFactor),
            ),
            child: Image.asset(
              imagePath,
              height: logoHeight * scaleFactor,
              width: logoWidth * scaleFactor,
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.only(left: 8.h, right: 16.h),
      child: CustomTextFormField(
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
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: EdgeInsets.only(left: 8.h, right: 16.h),
      child: Obx(
        () => CustomTextFormField(
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
        ),
      ),
    );
  }

  Widget _buildConfirmpassword() {
    return Padding(
      padding: EdgeInsets.only(left: 8.h, right: 16.h),
      child: Obx(
        () => CustomTextFormField(
          controller: controller.confirmpasswordController,
          hintText: "msg_confirm_your_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          obscureText: controller.isShowPassword1.value,
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
              controller.toggleShowPassword1();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 9.h),
              child: Obx(() => SvgPicture.asset(
                    controller.eyeImage1,
                    height: 37.v,
                    width: 30.h,
                  )),
            ),
          ),
          suffixConstraints: BoxConstraints(maxHeight: 50.v),
        ),
      ),
    );
  }

  Widget _buildNine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.v, bottom: 6.v),
          child: SizedBox(width: 110.h, child: Divider()),
        ),
        Text(
          "msg_or_continue_with".tr,
          style: theme.textTheme.labelLarge,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.v, bottom: 6.v),
          child: SizedBox(width: 110.h, child: Divider()),
        ),
      ],
    );
  }

  onTapTxtAlreadyhavean() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
