import 'controller/place_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/custom_elevated_button.dart';

class PlaceScreen extends GetWidget<PlaceController> {
  const PlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
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
                      _buildNineStack(),
                      SizedBox(height: 18.v),
                      _buildEightyEightRow(),
                      SizedBox(height: 13.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: 305.h,
                              margin: EdgeInsets.only(left: 29.h, right: 57.h),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "lbl_about".tr,
                                        style: CustomTextStyles
                                            .titleMediumff543855),
                                    TextSpan(
                                        text: "lbl".tr,
                                        style: CustomTextStyles
                                            .titleMediumff543855_1),
                                    TextSpan(
                                        text: "msg_lorem_ipsum_is_simply".tr,
                                        style:
                                            CustomTextStyles.titleSmallffc18553)
                                  ]),
                                  textAlign: TextAlign.left))),
                      SizedBox(height: 28.v),
                      CustomElevatedButton(
                          text: "lbl_get_address".tr,
                          margin: EdgeInsets.symmetric(horizontal: 46.h)),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildNineStack() {
    return SizedBox(
        height: 339.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topLeft, children: [
          CustomImageView(
              imagePath: ImageConstant.img12024919911911339x393,
              height: 339.v,
              width: 393.h,
              alignment: Alignment.center),
          CustomImageView(
              imagePath: ImageConstant.imgNounBack1521721Primarycontainer,
              height: 50.v,
              width: 41.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 25.h, top: 45.v),
              onTap: () {
                onTapImgNounBack();
              })
        ]));
  }

  /// Section Widget
  Widget _buildEightyEightRow() {
    return Padding(
        padding: EdgeInsets.only(left: 30.h, right: 19.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 231.h,
                  margin: EdgeInsets.only(top: 2.v),
                  child: Text("msg_grand_egyptian_museum3".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge)),
              Container(
                  width: 74.h,
                  margin: EdgeInsets.only(left: 38.h, bottom: 22.v),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgNounRating1234317,
                            height: 38.v,
                            width: 30.h),
                        Padding(
                            padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
                            child: Text("lbl_4_5_5".tr,
                                style: CustomTextStyles.titleMediumInter))
                      ]))
            ]));
  }

  /// Navigates to the explorePlacesScreen when the action is triggered.
  onTapImgNounBack() {
    Get.toNamed(
      AppRoutes.explorePlacesScreen,
    );
  }
}
