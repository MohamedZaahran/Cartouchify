import 'controller/big_size_background_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ignore_for_file: must_be_immutable
class BigSizeBackgroundScreen extends GetWidget<BigSizeBackgroundController> {
  const BigSizeBackgroundScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 1000.v,
          width: 500.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgGroup5,
                height: 1000.v,
                width: 500.h,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 1000.v,
                    width: 500.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
