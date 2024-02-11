import 'package:flutter_svg/flutter_svg.dart';

import 'controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/core/utils/validation_functions.dart';
import 'package:hierosecret/widgets/custom_elevated_button.dart';
import 'package:hierosecret/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  ForgotPasswordScreen({Key? key})
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
                ImageConstant.imgOnboarding,
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
                  padding: EdgeInsets.symmetric(horizontal: 46.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageConstant.imgVector,
                        height: 243.v,
                        width: 198.h,
                      ),
                      SizedBox(height: 44.v),
                      Text(
                        "msg_forgot_password".tr,
                        style: theme.textTheme.headlineMedium,
                      ),
                      SizedBox(height: 11.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "lbl_e_mail".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 1.v),
                      CustomTextFormField(
                        controller: controller.emailController,
                        hintText: "msg_enter_your_e_mail".tr,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                        prefix: Container(
                          margin: EdgeInsets.fromLTRB(15.h, 5.v, 18.h, 1.v),
                          child: SvgPicture.asset(
                            ImageConstant.imgNouncontemporaryliterature51817621,
                            height: 44.v,
                            width: 35.h,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: 50.v,
                        ),
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_email".tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 86.v),
                      CustomElevatedButton(
                        text: "lbl_reset".tr,
                      ),
                      SizedBox(height: 5.v),
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
