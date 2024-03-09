// HomeOnboardingScreen
import 'package:flutter_svg/svg.dart';
import 'package:hierosecret/presentation/home_page/home_page.dart';
import 'controller/home_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/custom_elevated_button.dart';

class HomeOnboardingScreen extends GetWidget<HomeOnboardingController> {
  const HomeOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments;
    if (args == null) {
      // Handle the case when arguments are null
      return Scaffold(
        body: Center(
          child: Text("Missing arguments"),
        ),
      );
    }
    final String fullName = args["fullName"];
    final String userID = args["userID"];

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
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 39.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.v),
                SvgPicture.asset(
                  ImageConstant.imgVectorRed300,
                  height: 304.v,
                  width: 142.h,
                ),
                SizedBox(height: 85.v),
                SizedBox(
                  width: 313.h,
                  child: Text(
                    "Hello $fullName,  Welcome to a journey of discovery! I'm queen Nefertiti, your guide on this adventure to unveil the hidden secrets that await you. Together, we'll navigate through the mysteries and unlock the treasures of knowledge",
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleMedium18,
                  ),
                ),
                SizedBox(height: 79.v),
                CustomElevatedButton(
                  text: "lbl_let_s_explore".tr,
                  margin: EdgeInsets.symmetric(horizontal: 6.h),
                  buttonStyle: CustomButtonStyles.fillRed,
                  onPressed: () {
                    Get.to(() => HomePage(fullName: fullName, userID: userID));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
