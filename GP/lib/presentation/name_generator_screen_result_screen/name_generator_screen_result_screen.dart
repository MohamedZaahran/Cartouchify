import 'controller/name_generator_screen_result_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/app_bar/appbar_leading_image.dart';
import 'package:hierosecret/widgets/app_bar/custom_app_bar.dart';
import 'package:hierosecret/widgets/custom_outlined_button.dart';
import 'package:hierosecret/widgets/custom_text_form_field.dart';

class NameGeneratorScreenResultScreen
    extends GetWidget<NameGeneratorScreenResultController> {
  const NameGeneratorScreenResultScreen({Key? key}) : super(key: key);

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
                        fit: BoxFit.cover)),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      _buildAppBar(),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 21.h, vertical: 38.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 290.h,
                                    margin:
                                        EdgeInsets.only(left: 9.h, right: 51.h),
                                    child: Text("msg_enter_name_you_wish".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.titleLarge)),
                                SizedBox(height: 13.v),
                                Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                        height: 68.v,
                                        width: 301.h,
                                        child: Stack(
                                            alignment: Alignment.topLeft,
                                            children: [
                                              CustomTextFormField(
                                                  width: 301.h,
                                                  controller: controller
                                                      .nameGeneratorvalueController,
                                                  hintText: "lbl_mohamed".tr,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 28.h,
                                                          vertical: 14.v)),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 4.h),
                                                      child: Text("lbl_name".tr,
                                                          style: theme.textTheme
                                                              .titleSmall)))
                                            ]))),
                                SizedBox(height: 15.v),
                                CustomOutlinedButton(
                                    width: 213.h,
                                    text: "lbl_generate".tr,
                                    alignment: Alignment.center),
                                SizedBox(height: 22.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 9.h),
                                    child: Text(
                                        "msg_your_name_in_heiroglyphics".tr,
                                        style:
                                            CustomTextStyles.titleLargeRed300)),
                                SizedBox(height: 2.v),
                                _buildFrameSix(),
                                SizedBox(height: 12.v),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  "msg_for_dictionary_more2".tr,
                                              style: CustomTextStyles
                                                  .labelLargeffc18553),
                                          TextSpan(
                                              text: "lbl_click_here".tr,
                                              style: CustomTextStyles
                                                  .labelLargeff543855
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline))
                                        ]),
                                        textAlign: TextAlign.left)),
                                SizedBox(height: 5.v)
                              ]))
                    ])))));
  }

  /// Section Widget
  Widget _buildAppBar() {
    return SizedBox(
        height: 90.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          CustomAppBar(
              leadingWidth: double.maxFinite,
              leading: AppbarLeadingImage(
                  imagePath: ImageConstant.imgNounBack1521721Primarycontainer,
                  margin: EdgeInsets.only(left: 25.h, top: 45.v, right: 327.h),
                  onTap: () {
                    onTapNounBack();
                  }),
              styleType: Style.bgFill),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text("lbl_name_generator".tr,
                  style: theme.textTheme.headlineLarge))
        ]));
  }

  /// Section Widget
  Widget _buildFrameSix() {
    return Container(
        width: 350.h,
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 137.h, vertical: 5.v),
        decoration: AppDecoration.fillRed,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: ImageConstant.imgEglyphtop1,
              height: 31.v,
              width: 55.h),
          CustomImageView(
              imagePath: ImageConstant.imgEglyphm1, height: 50.v, width: 55.h),
          CustomImageView(
              imagePath: ImageConstant.imgEglypho1, height: 44.v, width: 55.h),
          CustomImageView(
              imagePath: ImageConstant.imgEglyphh1, height: 27.v, width: 55.h),
          CustomImageView(
              imagePath: ImageConstant.imgEglypha1, height: 44.v, width: 55.h),
          CustomImageView(
              imagePath: ImageConstant.imgEglyphm1, height: 50.v, width: 55.h),
          CustomImageView(
              imagePath: ImageConstant.imgEglyphe1, height: 30.v, width: 55.h),
          CustomImageView(
              imagePath: ImageConstant.imgEglyphd1, height: 26.v, width: 55.h),
          SizedBox(height: 19.v),
          CustomImageView(
              imagePath: ImageConstant.imgEglyphbottom1,
              height: 40.v,
              width: 55.h)
        ]));
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapNounBack() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
