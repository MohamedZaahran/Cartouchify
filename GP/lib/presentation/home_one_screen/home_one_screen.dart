import '../home_one_screen/widgets/homeonegrid_item_widget.dart';
import 'controller/home_one_controller.dart';
import 'models/homeonegrid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/home_page/home_page.dart';
import 'package:hierosecret/widgets/app_bar/appbar_subtitle.dart';
import 'package:hierosecret/widgets/app_bar/custom_app_bar.dart';
import 'package:hierosecret/widgets/custom_bottom_app_bar.dart';
import 'package:hierosecret/widgets/custom_floating_button.dart';

// ignore_for_file: must_be_immutable
class HomeOneScreen extends GetWidget<HomeOneController> {
  const HomeOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 26.h,
            vertical: 19.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_what_s_new".tr,
                style: CustomTextStyles.titleLargeBlack900,
              ),
              SizedBox(height: 12.v),
              _buildFive(),
              SizedBox(height: 22.v),
              Padding(
                padding: EdgeInsets.only(left: 5.h),
                child: Text(
                  "lbl_activities".tr,
                  style: CustomTextStyles.titleLargeBlack900,
                ),
              ),
              SizedBox(height: 12.v),
              _buildHomeOneGrid(),
              SizedBox(height: 27.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildFiftyNine(),
        floatingActionButton: CustomFloatingButton(
          height: 83,
          width: 83,
          child: Icon(
            Icons.add,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 87.v,
      title: AppbarSubtitle(
        text: "lbl_hi_ahmed".tr,
        margin: EdgeInsets.only(left: 26.h),
      ),
      actions: [
        Container(
          height: 50.adaptSize,
          width: 50.adaptSize,
          margin: EdgeInsets.symmetric(
            horizontal: 22.h,
            vertical: 3.v,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(
              25.h,
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFive() {
    return Container(
      margin: EdgeInsets.only(
        left: 5.h,
        right: 16.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 72.v,
      ),
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgArrow1Black900,
            height: 2.v,
            width: 1.h,
            margin: EdgeInsets.only(
              left: 3.h,
              top: 3.v,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrow2Black900,
            height: 2.v,
            width: 1.h,
            margin: EdgeInsets.only(top: 2.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHomeOneGrid() {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.h,
        right: 16.h,
      ),
      child: Obx(
        () => GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 151.v,
            crossAxisCount: 2,
            mainAxisSpacing: 26.h,
            crossAxisSpacing: 26.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount:
              controller.homeOneModelObj.value.homeonegridItemList.value.length,
          itemBuilder: (context, index) {
            HomeonegridItemModel model = controller
                .homeOneModelObj.value.homeonegridItemList.value[index];
            return HomeonegridItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFiftyNine() {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {
        Get.toNamed(getCurrentRoute(type), id: 1);
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Profile:
        return AppRoutes.homePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      default:
        return DefaultWidget();
    }
  }
}
