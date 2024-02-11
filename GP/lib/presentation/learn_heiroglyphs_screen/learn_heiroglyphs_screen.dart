import 'controller/learn_heiroglyphs_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ignore_for_file: must_be_immutable
class LearnHeiroglyphsScreen extends GetWidget<LearnHeiroglyphsController> {
  const LearnHeiroglyphsScreen({Key? key})
      : super(
          key: key,
        );

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
              image: AssetImage(
                ImageConstant.imgOnboarding,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 5.v),
                _buildLearnHeiroglyphsNounBack(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLearnHeiroglyphsNounBack() {
    return SizedBox(
      height: 95.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgNounBack1521721Primarycontainer,
            height: 50.v,
            width: 41.h,
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(left: 25.h),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 90.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
