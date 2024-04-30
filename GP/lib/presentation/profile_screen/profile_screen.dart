import 'controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/home_page/home_page.dart';
import 'package:hierosecret/widgets/custom_bottom_app_bar.dart';
import 'package:hierosecret/widgets/custom_floating_button.dart';
import 'package:hierosecret/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class ProfileScreen extends GetWidget<ProfileController> {
  Map<String, dynamic>? args;
  String fullName;
  String userID;

  ProfileScreen({Key? key})
      : fullName = '',
        userID = '',
        super(key: key) {
    GetArguments();
  }

  void GetArguments() {
    args = Get.arguments;
    fullName = args!['fullName'];
    userID = args!['userID'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          padding: EdgeInsets.only(bottom: 105.v),
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
            padding: EdgeInsets.symmetric(
              horizontal: 25.h,
              vertical: 24.v,
            ),
            child: Column(
              children: [
                SizedBox(height: 21.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgNounBack1521721,
                        height: 50.v,
                        width: 41.h,
                        margin: EdgeInsets.only(bottom: 114.v),
                      ),
                      Container(
                        height: 122.adaptSize,
                        width: 122.adaptSize,
                        margin: EdgeInsets.only(
                          left: 70.h,
                          top: 42.v,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.h,
                          vertical: 9.v,
                        ),
                        decoration: AppDecoration.outlineBlueGray.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder61,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgSettingsPrimary,
                          height: 91.v,
                          width: 67.h,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 31.v),
                CustomOutlinedButton(
                  width: 213.h,
                  text: "lbl_change_avatar".tr,
                ),
                SizedBox(height: 38.v),
                SizedBox(height: 17.v),
                _buildTwentyColumn(),
                SizedBox(height: 43.v),
                _buildSeventeenColumn(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomAppBar(
          onChanged: (type) {
            // Handle navigation logic here
            Get.toNamed(getCurrentRoute(type), arguments: {
              fullName: args!['fullName'],
              userID: args!['userID']
            });
          },
        ),
        floatingActionButton: CustomFloatingButton(
          height: 83,
          width: 83,
          backgroundColor: theme.colorScheme.primary,
          child: CustomImageView(
            imagePath: ImageConstant.imgContrast,
            height: 41.5.v,
            width: 41.5.h,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyColumn() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.outlineRed.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: _buildAddressesRow(
              image: ImageConstant.imgFramePrimary23x24,
              addresses: "lbl_personal_info".tr,
            ),
          ),
          SizedBox(height: 8.v),
          Divider(
            color: appTheme.gray500.withOpacity(0.5),
          ),
          SizedBox(height: 5.v),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: _buildAddressesRow(
              image: ImageConstant.imgFrame23x24,
              addresses: "lbl_addresses".tr,
            ),
          ),
          SizedBox(height: 9.v),
          Divider(
            color: appTheme.gray500.withOpacity(0.5),
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: _buildAddressesRow(
              image: ImageConstant.imgFrame1,
              addresses: "lbl_privacy".tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventeenColumn() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.outlineRed.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: _buildAddressesRow(
              image: ImageConstant.imgFramePrimary24x24,
              addresses: "lbl_contact_us".tr,
            ),
          ),
          SizedBox(height: 8.v),
          Divider(
            color: appTheme.gray500.withOpacity(0.5),
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: _buildAddressesRow(
              image: ImageConstant.imgFrame24x24,
              addresses: "lbl_help".tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNavBarBottomAppBar() {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {
        print(getCurrentRoute(type));
        Get.toNamed(getCurrentRoute(type));
      },
    );
  }

  /// Common widget
  Widget _buildAddressesRow({
    required String image,
    required String addresses,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: image,
          height: 23.v,
          width: 24.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.h),
          child: Text(
            addresses,
            style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ) ??
                TextStyle(), // Providing a default TextStyle if theme.textTheme.bodyLarge is null
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 23.v,
          width: 24.h,
        ),
      ],
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }
}
