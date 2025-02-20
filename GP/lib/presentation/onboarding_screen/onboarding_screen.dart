import 'package:flutter_svg/svg.dart';
import 'package:hierosecret/presentation/register_screen/controller/register_controller.dart';
import 'package:hierosecret/presentation/register_screen/register_screen.dart';

import 'package:hierosecret/presentation/home_page/controller/home_controller.dart';
import 'package:hierosecret/presentation/home_page/home_page.dart';

import 'package:hierosecret/presentation/home_one_screen/controller/home_one_controller.dart';
import 'package:hierosecret/presentation/home_one_screen/home_one_screen.dart';

import 'package:hierosecret/presentation/home_container_screen/controller/home_container_controller.dart';
import 'package:hierosecret/presentation/home_container_screen/home_container_screen.dart';

import 'package:hierosecret/presentation/app_navigation_screen/app_navigation_screen.dart';

import 'controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ... (imports and class definition)

class OnboardingScreen extends GetWidget<OnboardingController> {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if the RegisterController is not null before using it

    return SafeArea(
      child: Scaffold(
        // ... (other scaffold properties)
        body: GestureDetector(
          onTap: () {
            // Navigate to RegisterScreen when tapped
            Get.to(RegisterScreen());
          },
          child: Container(
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
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 22.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageConstant.imgNounEgypt22733,
                    height: 225.v,
                    width: 200.h,
                  ),
                  SizedBox(height: 26.v),
                  Text(
                    "CARTOUCHIFY".tr,
                    style: theme.textTheme.displayMedium,
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
