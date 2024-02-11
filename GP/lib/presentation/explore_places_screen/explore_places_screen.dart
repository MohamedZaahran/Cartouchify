import '../explore_places_screen/widgets/cardslist_item_widget.dart';
import 'controller/explore_places_controller.dart';
import 'models/cardslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/app_bar/custom_app_bar.dart';

class ExplorePlacesScreen extends GetWidget<ExplorePlacesController> {
  const ExplorePlacesScreen({Key? key}) : super(key: key);

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
                      _buildViewStack(),
                      SizedBox(height: 44.v),
                      _buildCardsList()
                    ])))));
  }

  /// Section Widget
  Widget _buildViewStack() {
    return SizedBox(
        height: 93.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          CustomAppBar(),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 37.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgVectorPrimarycontainer,
                            height: 24.v,
                            width: 16.h,
                            margin: EdgeInsets.only(top: 3.v, bottom: 13.v)),
                        Padding(
                            padding: EdgeInsets.only(left: 32.h),
                            child: Text("lbl_explore_places".tr,
                                style: theme.textTheme.headlineLarge))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildCardsList() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 31.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.v);
            },
            itemCount: controller
                .explorePlacesModelObj.value.cardslistItemList.value.length,
            itemBuilder: (context, index) {
              CardslistItemModel model = controller
                  .explorePlacesModelObj.value.cardslistItemList.value[index];
              return CardslistItemWidget(model, onTapCards: () {
                onTapCards();
              });
            })));
  }

  /// Navigates to the placeScreen when the action is triggered.
  onTapCards() {
    Get.toNamed(
      AppRoutes.placeScreen,
    );
  }
}
