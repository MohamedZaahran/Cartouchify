import 'package:flutter_svg/svg.dart';

import 'controller/place_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter_svg/svg.dart';

class PlaceScreen extends GetWidget<PlaceController> {
  const PlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments
    final Map<String, dynamic>? args = Get.arguments;
    final String name = args?['name'] ?? '';
    final String About = args?['About'] ?? '';
    final String imageUrl = args?['Imageurl'] ?? '';
    final String latitude = args?['latitude'] ?? '';
    final String longitude = args?['longitude'] ?? '';
    final String rating = args?['rating'] ?? '';

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgOnboarding,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: SizeUtils.width,
            height: SizeUtils.height,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildNineStack(imageUrl),
                  SizedBox(height: 10),
                  _buildEightyEightRow(name, rating),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 305,
                      margin: EdgeInsets.only(left: 29, right: 57),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_about".tr,
                              style: CustomTextStyles.titleMediumff543855,
                            ),
                            TextSpan(
                              text: "lbl".tr,
                              style: CustomTextStyles.titleMediumff543855_1,
                            ),
                            TextSpan(
                              text: About,
                              style: CustomTextStyles.titleSmallffc18553,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  CustomElevatedButton(
                    text: "lbl_get_address".tr,
                    margin: EdgeInsets.symmetric(horizontal: 46),
                    onPressed: () {
                      try {
                        double lat = double.parse(latitude);
                        double lon = double.parse(longitude);
                        launchGoogleMapsApp(lat, lon);
                      } catch (e) {
                        print("Error launching Google Maps: $e");
                        // Handle the error or display a user-friendly message
                      }
                    },
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNineStack(String imageUrl) {
    return SizedBox(
      height: 300,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          imageUrl.isNotEmpty
              ? Image.network(
                  imageUrl,
                  height: 339.v,
                  width: 393.h,
                  fit: BoxFit.cover,
                )
              : SizedBox(),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEightyEightRow(String name, String rating) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 231,
            margin: EdgeInsets.only(top: 2),
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge,
            ),
          ),
          Container(
            width: 74,
            margin: EdgeInsets.only(left: 4, bottom: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageConstant.imgNounRating1234317,
                  height: 38,
                  width: 31,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 9),
                  child: Text(
                    "$rating/5".tr,
                    style: CustomTextStyles.titleMediumInter,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void launchGoogleMapsApp(double latitude, double longitude) {
    if (latitude != null && longitude != null) {
      MapsLauncher.launchCoordinates(latitude, longitude, 'Google Maps');
    } else {
      print("Invalid latitude or longitude");
    }
  }
}
