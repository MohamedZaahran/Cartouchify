import 'controller/scanned_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

class ScannedScreen extends GetWidget<ScannedController> {
  const ScannedScreen({Key? key}) : super(key: key);

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
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.h, vertical: 45.v),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.v),
                          CustomImageView(
                              imagePath: ImageConstant
                                  .imgNounBack1521721Primarycontainer,
                              height: 50.v,
                              width: 41.h,
                              onTap: () {
                                onTapImgNounBack();
                              })
                        ])))));
  }

  /// Navigates to the lastScannedScreen when the action is triggered.
  onTapImgNounBack() {
    Get.toNamed(
      AppRoutes.lastScannedScreen,
    );
  }
}
