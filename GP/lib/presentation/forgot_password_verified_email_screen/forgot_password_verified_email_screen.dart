import 'controller/forgot_password_verified_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/core/utils/validation_functions.dart';
import 'package:hierosecret/widgets/custom_elevated_button.dart';
import 'package:hierosecret/widgets/custom_floating_text_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordVerifiedEmailScreen
    extends GetWidget<ForgotPasswordVerifiedEmailController> {
  ForgotPasswordVerifiedEmailScreen({Key? key})
      : super(
          key: key,
        );

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
              image: AssetImage(
                ImageConstant.imgForgotPassword,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 42.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 13.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgVector,
                        height: 243.v,
                        width: 198.h,
                      ),
                      SizedBox(height: 44.v),
                      Text(
                        "msg_forgot_password".tr,
                        style: theme.textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: 68.v,
                        width: 301.h,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Obx(
                              () => CustomFloatingTextField(
                                width: 301.h,
                                controller: controller.newpasswordController,
                                labelText: "msg_enter_new_password".tr,
                                labelStyle: CustomTextStyles.interBlack900,
                                hintText: "msg_enter_new_password".tr,
                                textInputType: TextInputType.visiblePassword,
                                obscureText: controller.isShowPassword.value,
                                alignment: Alignment.bottomCenter,
                                prefix: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 17.h),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgSettings,
                                    height: 32.v,
                                    width: 28.h,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 50.v,
                                ),
                                suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword.value =
                                        !controller.isShowPassword.value;
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 9.h),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgPasseye,
                                      height: 37.v,
                                      width: 30.h,
                                    ),
                                  ),
                                ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 50.v,
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_password"
                                        .tr;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 7.h),
                                child: Text(
                                  "lbl_password".tr,
                                  style: theme.textTheme.titleSmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 7.h),
                          child: Text(
                            "msg_confirm_password".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.v),
                      Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: Obx(
                          () => CustomFloatingTextField(
                            controller: controller.confirmpasswordController,
                            labelText: "msg_confirm_password2".tr,
                            labelStyle: CustomTextStyles.interBlack900,
                            hintText: "msg_confirm_password2".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            obscureText: controller.isShowPassword1.value,
                            prefix: Container(
                              margin: EdgeInsets.symmetric(horizontal: 17.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgSettings,
                                height: 32.v,
                                width: 28.h,
                              ),
                            ),
                            prefixConstraints: BoxConstraints(
                              maxHeight: 50.v,
                            ),
                            suffix: InkWell(
                              onTap: () {
                                controller.isShowPassword1.value =
                                    !controller.isShowPassword1.value;
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 9.h),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgPasseye,
                                  height: 37.v,
                                  width: 30.h,
                                ),
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                              maxHeight: 50.v,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_password".tr;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 71.v),
                      CustomElevatedButton(
                        text: "lbl_reset".tr,
                        margin: EdgeInsets.symmetric(horizontal: 4.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
