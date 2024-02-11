import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "OnBoarding".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "BIG SIZE BACKGROUND".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.bigSizeBackgroundScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Regular".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.regularScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Register".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.registerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Register(Wrong Inputs)".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.registerWrongInputsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Login".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Forgot Password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Forgot Password (Email Sent)".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.forgotPasswordEmailSentScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Forgot Password (Verified Email)".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.forgotPasswordVerifiedEmailScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Home OnBoarding".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homeOnboardingScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Scanning Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.scanningScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Scanning Screen BLACK".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.scanningScreenBlackScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Home - Container".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homeContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.profileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Name Generator Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.nameGeneratorScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Explore Places Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.explorePlacesScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Last Scanned".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.lastScannedScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Learn Heiroglyphs".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.learnHeiroglyphsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Name Generator Screen (RESULT)".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.nameGeneratorScreenResultScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Place Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.placeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Scanned Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.scannedScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Home One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homeOneScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
