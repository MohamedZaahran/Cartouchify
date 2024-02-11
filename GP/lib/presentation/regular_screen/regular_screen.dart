import 'controller/regular_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ignore_for_file: must_be_immutable
class RegularScreen extends GetWidget<RegularController> {
  const RegularScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: CustomImageView(
            imagePath: ImageConstant.imgOnboarding,
            height: 852.v,
            width: 393.h,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
