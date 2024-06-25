import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:hierosecret/widgets/app_bar/custom_app_bar.dart';
import 'package:hierosecret/widgets/custom_bottom_app_bar.dart';
import 'package:hierosecret/widgets/custom_floating_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../home_page/widgets/grid_item_widget.dart';
import '../home_page/widgets/slider_item_widget.dart';
import 'controller/home_controller.dart';
import 'models/grid_item_model.dart';
import 'models/home_model.dart';
import 'models/slider_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  String fullName;
  String userID;

  HomePage({Key? key, required this.fullName, required this.userID})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller =
      Get.put(HomeController.withModel(HomeModel().obs));
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      widget.fullName = Get.arguments['fullName'] ?? widget.fullName;
      widget.userID = Get.arguments['userID'] ?? widget.userID;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: SizeUtils.width,
            height: SizeUtils.height,
            padding: EdgeInsets.only(top: 56.v),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              image: DecorationImage(
                image: AssetImage(ImageConstant.imgOnboarding),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's New?".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 5.v),
                  _buildSlider(),
                  SizedBox(height: 13.v),
                  Obx(
                    () => Container(
                      height: 15.v,
                      margin: EdgeInsets.only(left: 120.h),
                      child: AnimatedSmoothIndicator(
                        activeIndex: controller.sliderIndex.value,
                        count: controller
                            .homeModelObj.value.sliderItemList.value.length,
                        axisDirection: Axis.horizontal,
                        effect: ScrollingDotsEffect(
                          spacing: 5,
                          activeDotColor: appTheme.red300,
                          dotColor: theme.colorScheme.primary,
                          dotHeight: 15.v,
                          dotWidth: 15.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 6.h,
                    ),
                    child: Text(
                      "lbl_activities".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  _buildGrid(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomAppBar(
          currentTab: BottomBarEnum.Home,
          onChanged: (type) {
            try {
              String route = getCurrentRoute(type);
              print(
                  'Navigating to route: $route with arguments: fullName=${widget.fullName}, userID=${widget.userID}');
              Get.toNamed(route, arguments: {
                'fullName': widget.fullName,
                'userID': widget.userID,
              });
            } catch (e) {
              print('Navigation error: $e');
            }
          },
        ),
        floatingActionButton: CustomFloatingButton(
          height: 83,
          width: 83,
          onTap: () {
            _showImageSourceBottomSheet();
          },
          child: Image.asset(
            ImageConstant.ScanImage,
            height: 40,
            width: 40,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 100.v,
      title: AppbarSubtitleOne(
        text: "Hi, ${widget.fullName}",
        margin: EdgeInsets.only(left: 26.h),
      ),
      actions: [
        StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(widget.userID)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            var userData = snapshot.data!.data() as Map<String, dynamic>?;

            return Container(
              margin: EdgeInsets.fromLTRB(5.h, 22.v, 22.h, 6.v),
              child: ClipOval(
                child: Container(
                  width: 55.v,
                  height: 55.v,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: userData != null && userData['avatarURL'] != null
                      ? Image.network(
                          userData['avatarURL'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return SvgPicture.asset(
                              ImageConstant.imgSettingsPrimary,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : SvgPicture.asset(
                          ImageConstant.imgSettingsPrimary,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSlider() {
    var sliderItemList = controller.homeModelObj.value.sliderItemList;
    Timer? timer; // Declare timer variable

    // Function to auto-scroll the slider
    void autoScroll() {
      timer = Timer.periodic(Duration(seconds: 2), (timer) {
        _carouselController.nextPage(); // Scroll to the next page
      });
    }

    // Cancel the timer when the widget is disposed
    @override
    void dispose() {
      timer?.cancel();
      super.dispose();
    }

    autoScroll();

    // Build the slider widget
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Stack(
        children: [
          GestureDetector(
            // Pause auto-scroll when user touches the slider
            onTapDown: (_) {
              timer?.cancel();
            },
            onTapUp: (_) {
              autoScroll(); // Resume auto-scroll when user releases touch
            },
            child: CarouselSlider.builder(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 153,
                initialPage: controller.sliderIndex.value,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  controller.sliderIndex.value = index;
                },
                viewportFraction: 1.0,
              ),
              itemCount: sliderItemList.value.length,
              itemBuilder: (context, index, realIndex) {
                SliderItemModel model = sliderItemList.value[index];
                return SliderItemWidget(model);
              },
            ),
          ),
          Positioned(
            left: 10.0,
            top: 0.0,
            bottom: 0.0,
            child: IconButton(
              onPressed: () {
                _carouselController.previousPage();
              },
              icon: Icon(Icons.arrow_back_ios),
              color: theme.colorScheme.primaryContainer,
            ),
          ),
          Positioned(
            right: 10.0,
            top: 0.0,
            bottom: 0.0,
            child: IconButton(
              onPressed: () {
                _carouselController.nextPage();
              },
              icon: Icon(Icons.arrow_forward_ios),
              color: theme.colorScheme.primaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return Obx(
      () => GridView.builder(
        padding: EdgeInsets.only(top: 20.v),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 160.v,
          crossAxisCount: 2,
          mainAxisSpacing: 26,
          crossAxisSpacing: 26,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.homeModelObj.value.gridItemList.value.length,
        itemBuilder: (context, index) {
          GridItemModel model =
              controller.homeModelObj.value.gridItemList.value[index];
          return GridItemWidget(model, onTapTwentySix: () {
            onTapTwentySix(index);
          });
        },
      ),
    );
  }

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

  Widget getCurrentPage(String currentRoute, String fullName, String userID) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage(
          fullName: fullName,
          userID: userID,
        );
      default:
        return DefaultWidget();
    }
  }

  onTapTwentySix(int index) {
    print(index);
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.nameGeneratorScreen);
        break;
      case 1:
        Get.toNamed(AppRoutes.explorePlacesScreen);
        break;
      case 2:
        Get.toNamed(AppRoutes.lastScannedScreen);
        break;
      case 3:
        Get.toNamed(AppRoutes.learnHeiroglyphsScreen);
        break;
      default:
        break;
    }
  }

  void _showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Take a picture'),
                onTap: () {
                  Navigator.pop(context);
                  _openCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _openGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      _uploadImage(imageFile);
    }
  }

  void _openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      _uploadImage(imageFile);
    }
  }

  void _uploadImage(File imageFile) async {
    String url =
        'http://192.168.1.10:5000/predict'; // Replace with your Flask server URL

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files
          .add(await http.MultipartFile.fromPath('file', imageFile.path));
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var result = jsonDecode(responseData);

        // Extract description as a string
        String description = result['description'].toString();

        // Navigate to ScannedScreen with image path and prediction result
        Get.toNamed(AppRoutes.scannedScreen, arguments: {
          'imagePath': imageFile.path,
          'predicted_class_index': result['predicted_class_index'],
          'description': description
        });
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  void _showResultDialog(Map<String, dynamic> result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Prediction Result'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Class Index: ${result['predicted_class_index']}'),
              Text('Description: ${result['description']}'),
            ],
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
