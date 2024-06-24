import 'package:get/get.dart';
import 'controller/explore_places_controller.dart';
import 'models/cardslist_item_model.dart';
import 'widgets/cardslist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/app_bar/custom_app_bar.dart';
import 'package:hierosecret/presentation/explore_places_screen/controller/firestore_service.dart';

class ExplorePlacesScreen extends GetWidget<ExplorePlacesController> {
  const ExplorePlacesScreen({Key? key}) : super(key: key);

  @override
  void onInit() {
    print("onInit called");
    controller.fetchPlaces();
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgOnboarding,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              _buildViewStack(),
              Expanded(
                child: _buildCardsList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewStack() {
    print("_buildViewStack called");
    return SizedBox(
      height: 90.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            color: Color(0xFF543855),
            child: CustomAppBar(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 37.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    iconSize: 24.v,
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 3.v, bottom: 13.v),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  CustomImageView(
                    height: 24.v,
                    width: 16.h,
                    margin: EdgeInsets.only(top: 3.v, bottom: 13.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "lbl_explore_places".tr,
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardsList(BuildContext context) {
    print("_buildCardsList called");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 15.v),
      child: FutureBuilder(
        future: controller.fetchPlaces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Obx(
              () => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: controller.explorePlacesList.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.0),
                itemBuilder: (context, index) {
                  CardslistItemModel model =
                      controller.explorePlacesList[index];
                  return _buildCard(model);
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildCard(CardslistItemModel model) {
    print("_buildCard called");
    return CardslistItemWidget(
      model,
      name: model.name,
      about: model.about,
      Imageurl: model.Imageurl,
      About: model.About,
      longitude: model.longitude,
      latitude: model.latitude,
      rating: model.rating,
      onTapCards: () {
        onTapCards(model);
      },
    );
  }

  onTapCards(CardslistItemModel model) {
    print("onTapCards called");
    Get.toNamed(
      AppRoutes.placeScreen,
      arguments: {
        'name': model.name!.value,
        'about': model.about!.value,
        'Imageurl': model.Imageurl!.value,
        'About': model.About!.value,
        'longitude': model.longitude!.value,
        'latitude': model.latitude!.value,
        'rating': model.rating!.value,
      },
    );
  }
}
