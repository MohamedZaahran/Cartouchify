import 'controller/register_wrong_inputs_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/core/utils/validation_functions.dart';
import 'package:hierosecret/widgets/custom_elevated_button.dart';
import 'package:hierosecret/widgets/custom_floating_text_field.dart';
import 'package:hierosecret/widgets/custom_icon_button.dart';
import 'package:hierosecret/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class RegisterWrongInputsScreen
    extends GetWidget<RegisterWrongInputsController> {
  RegisterWrongInputsScreen({Key? key}) : super(key: key);

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
                padding: EdgeInsets.only(bottom: 60.v),
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgOnboarding),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 34.h, vertical: 21.v),
                            child: Column(children: [
                              SizedBox(height: 45.v),
                              SizedBox(
                                  height: 228.v,
                                  width: 241.h,
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                                "msg_create_an_account".tr,
                                                style: theme
                                                    .textTheme.headlineMedium)),
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgNounEgypt22733Red300,
                                            height: 201.v,
                                            width: 179.h,
                                            alignment: Alignment.topCenter)
                                      ])),
                              SizedBox(height: 3.v),
                              SizedBox(
                                  height: 68.v,
                                  width: 301.h,
                                  child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        _buildCreateAccountForm(),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4.h),
                                                child: Text("lbl_full_name".tr,
                                                    style: theme
                                                        .textTheme.titleSmall)))
                                      ])),
                              SizedBox(height: 2.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 15.h),
                                      child: Text("lbl_e_mail".tr,
                                          style: theme.textTheme.titleSmall))),
                              _buildEmailForm(),
                              SizedBox(height: 2.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 15.h),
                                      child: Text("lbl_password".tr,
                                          style: theme.textTheme.titleSmall))),
                              _buildPasswordForm(),
                              SizedBox(height: 2.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 15.h),
                                      child: Text("msg_confirm_password".tr,
                                          style: theme.textTheme.titleSmall))),
                              _buildConfirmPasswordForm(),
                              SizedBox(height: 15.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 41.h),
                                      child: Text("msg_some_input_s_seem".tr,
                                          style: CustomTextStyles
                                              .labelLargeOnPrimaryContainer))),
                              SizedBox(height: 12.v),
                              _buildSignUpButton(),
                              SizedBox(height: 14.v),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtAlreadyhavean();
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_already_have_an2".tr,
                                            style: CustomTextStyles
                                                .bodyLargeffc18553),
                                        TextSpan(text: " "),
                                        TextSpan(
                                            text: "lbl_sign_in".tr,
                                            style: CustomTextStyles
                                                .titleMediumff543855_1
                                                .copyWith(
                                                    decoration: TextDecoration
                                                        .underline))
                                      ]),
                                      textAlign: TextAlign.left)),
                              SizedBox(height: 6.v),
                              _buildSocialMediaRow()
                            ]))))),
            bottomNavigationBar: _buildIconButtonsRow()));
  }

  /// Section Widget
  Widget _buildCreateAccountForm() {
    return CustomTextFormField(
        width: 301.h,
        controller: controller.createAccountFormController,
        hintText: "msg_enter_your_full".tr,
        alignment: Alignment.bottomCenter,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(15.h, 4.v, 18.h, 2.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgNounpharoh3278201,
                height: 44.v,
                width: 35.h)),
        prefixConstraints: BoxConstraints(maxHeight: 50.v),
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildEmailForm() {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 16.h),
        child: CustomTextFormField(
            controller: controller.emailFormController,
            hintText: "msg_enter_your_e_mail".tr,
            textInputType: TextInputType.emailAddress,
            prefix: Container(
                margin: EdgeInsets.fromLTRB(15.h, 5.v, 18.h, 1.v),
                child: CustomImageView(
                    imagePath:
                        ImageConstant.imgNouncontemporaryliterature51817621,
                    height: 44.v,
                    width: 35.h)),
            prefixConstraints: BoxConstraints(maxHeight: 50.v),
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            }));
  }

  /// Section Widget
  Widget _buildPasswordForm() {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 16.h),
        child: Obx(() => CustomFloatingTextField(
            controller: controller.passwordFormController,
            labelText: "msg_enter_your_password".tr,
            labelStyle: CustomTextStyles.interBlack900,
            hintText: "msg_enter_your_password".tr,
            textInputType: TextInputType.visiblePassword,
            obscureText: controller.isShowPassword.value,
            prefix: Container(
                margin: EdgeInsets.symmetric(horizontal: 17.h),
                child: CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 32.v,
                    width: 28.h)),
            prefixConstraints: BoxConstraints(maxHeight: 50.v),
            suffix: InkWell(
                onTap: () {
                  controller.isShowPassword.value =
                      !controller.isShowPassword.value;
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 9.h),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgPasseye,
                        height: 37.v,
                        width: 30.h))),
            suffixConstraints: BoxConstraints(maxHeight: 50.v),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            })));
  }

  /// Section Widget
  Widget _buildConfirmPasswordForm() {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 16.h),
        child: Obx(() => CustomFloatingTextField(
            controller: controller.confirmPasswordFormController,
            labelText: "msg_confirm_your_password".tr,
            labelStyle: CustomTextStyles.interBlack900,
            hintText: "msg_confirm_your_password".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: controller.isShowPassword1.value,
            prefix: Container(
                margin: EdgeInsets.symmetric(horizontal: 17.h),
                child: CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 32.v,
                    width: 28.h)),
            prefixConstraints: BoxConstraints(maxHeight: 50.v),
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
                        width: 30.h))),
            suffixConstraints: BoxConstraints(maxHeight: 50.v),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            })));
  }

  /// Section Widget
  Widget _buildSignUpButton() {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr, margin: EdgeInsets.symmetric(horizontal: 12.h));
  }

  /// Section Widget
  Widget _buildSocialMediaRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 6.v),
              child: SizedBox(width: 110.h, child: Divider())),
          Text("msg_or_continue_with".tr,
              style: CustomTextStyles.labelLargeGray500),
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 6.v),
              child: SizedBox(width: 110.h, child: Divider()))
        ]);
  }

  /// Section Widget
  Widget _buildIconButtonsRow() {
    return Padding(
        padding: EdgeInsets.only(left: 60.h, right: 60.h, bottom: 35.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 60.v,
              width: 59.h,
              padding: EdgeInsets.all(13.h),
              child: CustomImageView(imagePath: ImageConstant.imgGroup16)),
          Spacer(flex: 50),
          CustomIconButton(
              height: 60.v,
              width: 59.h,
              padding: EdgeInsets.all(13.h),
              child: CustomImageView(imagePath: ImageConstant.imgGroup15)),
          Spacer(flex: 50),
          CustomIconButton(
              height: 60.v,
              width: 59.h,
              padding: EdgeInsets.all(12.h),
              child: CustomImageView(imagePath: ImageConstant.imgGroup14))
        ]));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtAlreadyhavean() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
