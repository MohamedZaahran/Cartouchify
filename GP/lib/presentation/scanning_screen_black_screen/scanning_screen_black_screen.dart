import 'controller/scanning_screen_black_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/app_bar/appbar_leading_image.dart';
import 'package:hierosecret/widgets/app_bar/custom_app_bar.dart';
import 'package:hierosecret/widgets/custom_elevated_button.dart';

class ScanningScreenBlackScreen
    extends GetWidget<ScanningScreenBlackController> {
  const ScanningScreenBlackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 40.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgTelevision,
                                  height: 31.adaptSize,
                                  width: 31.adaptSize),
                              SizedBox(height: 8.v),
                              Text("lbl_gallery".tr,
                                  style: CustomTextStyles.labelLargeInter)
                            ]),
                            Container(
                                height: 53.v,
                                width: 58.h,
                                margin: EdgeInsets.only(top: 2.v),
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text("lbl_flashlight".tr,
                                              style: CustomTextStyles
                                                  .labelLargeInter)),
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgNounFlashlight6511487,
                                          height: 47.v,
                                          width: 38.h,
                                          alignment: Alignment.topCenter)
                                    ]))
                          ])),
                  SizedBox(height: 20.v),
                  _buildSeven(),
                  SizedBox(height: 28.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: 219.h,
                          margin: EdgeInsets.only(right: 52.h),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_please_align_the2".tr,
                                    style: CustomTextStyles
                                        .titleSmallInterffdf2c30),
                                TextSpan(
                                    text: "lbl_click_here2".tr,
                                    style: CustomTextStyles
                                        .titleSmallInterff543855
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline))
                              ]),
                              textAlign: TextAlign.center))),
                  SizedBox(height: 57.v),
                  CustomElevatedButton(
                      text: "lbl_translate".tr,
                      margin: EdgeInsets.symmetric(horizontal: 21.h),
                      buttonStyle: CustomButtonStyles.fillRed),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgNounClose3524197,
            margin: EdgeInsets.only(left: 25.h, top: 40.v, right: 322.h),
            onTap: () {
              onTapNounClose();
            }),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildSeven() {
    return SizedBox(
        height: 351.v,
        width: 343.h,
        child: Stack(alignment: Alignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgImage42,
              height: 351.v,
              width: 343.h,
              alignment: Alignment.center),
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 343.adaptSize,
                  width: 343.adaptSize,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: theme.colorScheme.primary, width: 2.h))))
        ]));
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapNounClose() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
