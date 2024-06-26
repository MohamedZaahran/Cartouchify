import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/custom_bottom_app_bar.dart';
import 'package:hierosecret/widgets/custom_floating_button.dart';
import 'package:hierosecret/widgets/custom_outlined_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hierosecret/widgets/country.dart';
import 'dart:io'; // Add this import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? args;
  String fullName = '';
  String userID = '';
  String selectedCountry = 'Egypt';
  String selectedCountryFlag = 'assets/flags/eg.png';
  String avatarURL = ''; // Default value

  @override
  void initState() {
    super.initState();
    GetArguments();
    if (userID.isNotEmpty) {
      _fetchCountry();
      _fetchAvatar();
    }
  }

  void GetArguments() {
    if (Get.arguments != null) {
      args = Get.arguments;
      fullName = args!['fullName'];
      userID = args!['userID'];
    }
  }

  Future<void> _fetchCountry() async {
    if (userID.isNotEmpty) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .get();
        if (userDoc.exists) {
          String newSelectedCountry = userDoc['selectedCountry'] ?? 'Egypt';
          setState(() {
            selectedCountry = newSelectedCountry;
            selectedCountryFlag = countries
                .firstWhere((country) => country.name == newSelectedCountry)
                .flag;
          });
        }
      } catch (e) {
        print('Error fetching user profile: $e');
      }
    }
  }

  Future<void> _fetchAvatar() async {
    if (userID.isNotEmpty) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .get();
        if (userDoc.exists) {
          String newAvatarURL = userDoc['avatarURL'] ?? '';
          setState(() {
            avatarURL = newAvatarURL;
          });
        }
      } catch (e) {
        print('Error fetching user profile: $e');
      }
    }
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 21.v),
                ClipOval(
                  child: avatarURL.isEmpty
                      ? CustomImageView(
                          imagePath: ImageConstant.imgSettingsPrimary,
                          height: 122.adaptSize,
                          width: 122.adaptSize,
                          alignment: Alignment.topCenter,
                        )
                      : Image.network(
                          avatarURL,
                          fit: BoxFit.cover,
                          height: 122.adaptSize,
                          width: 122.adaptSize,
                        ),
                ),
                SizedBox(height: 31.v),
                CustomOutlinedButton(
                  width: 213.h,
                  text: "lbl_change_avatar".tr,
                  onPressed: () {
                    _showImageSourceBottomSheet(context);
                  },
                ),
                SizedBox(height: 30.v),
                _buildCountryDropdown(context),
                SizedBox(height: 17.v),
                _buildTwentyColumn(context),
                SizedBox(height: 43.v),
                _buildSeventeenColumn(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomAppBar(
          currentTab: BottomBarEnum.Profile,
          onChanged: (type) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              try {
                String route = getCurrentRoute(type);
                print(
                    'Navigating to route: $route with arguments: fullName=$fullName, userID=$userID');
                Get.toNamed(route, arguments: {
                  'fullName': fullName,
                  'userID': userID,
                });
              } catch (e) {
                print('Navigation error: $e');
              }
            });
          },
        ),
        floatingActionButton: CustomFloatingButton(
          height: 83,
          width: 83,
          onTap: () {
            _showImageSourceBottomSheetScan();
          },
          backgroundColor: theme.colorScheme.primary,
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

  /// Country Dropdown Widget
  Widget _buildCountryDropdown(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 9.h,
                    top: 2.v,
                  ),
                  child: Container(
                    width: 310.h, // Adjust this width as needed
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedCountry,
                      icon: CustomImageView(
                        imagePath: ImageConstant.imgArrowRight,
                        height: 23.v,
                        width: 24.h,
                        margin: EdgeInsets.only(left: 10.h, bottom: 2.v),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountry = newValue!;
                          selectedCountryFlag = countries
                              .firstWhere((country) => country.name == newValue)
                              .flag;
                          _saveSelectedCountry(newValue);
                        });
                      },
                      items: countries
                          .map<DropdownMenuItem<String>>((Country country) {
                        return DropdownMenuItem<String>(
                          value: country.name,
                          child: Row(
                            children: [
                              Image.asset(
                                country.flag,
                                height: 20.v,
                                width: 20.h,
                              ),
                              SizedBox(width: 10.h),
                              Text(country.name),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveSelectedCountry(String newCountry) async {
    if (userID.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .update({
          'selectedCountry': newCountry,
        });
      } catch (e) {
        print('Error saving selected country: $e');
      }
    }
  }

  /// Section Widget
  Widget _buildTwentyColumn(BuildContext context) {
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
          GestureDetector(
            onTap: () {
              // Navigate to Personal Info screen
              Get.toNamed('/personal_info', arguments: {
                'fullName': fullName,
                'userID': userID,
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: _buildAddressesRow(
                image: ImageConstant.imgFramePrimary23x24,
                addresses: "lbl_personal_info".tr,
              ),
            ),
          ),
          SizedBox(height: 8.v),
          Divider(
            color: appTheme.gray500.withOpacity(0.5),
          ),
          SizedBox(height: 5.v),
          GestureDetector(
            onTap: () {
              // Navigate to Addresses screen
              Get.toNamed('/addresses', arguments: {
                'fullName': fullName,
                'userID': userID,
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: _buildAddressesRow(
                image: ImageConstant.imgFrame23x24,
                addresses: "lbl_addresses".tr,
              ),
            ),
          ),
          SizedBox(height: 9.v),
          Divider(
            color: appTheme.gray500.withOpacity(0.5),
          ),
          SizedBox(height: 6.v),
          GestureDetector(
            onTap: () {
              // Navigate to Privacy screen
              Get.toNamed('/privacy', arguments: {
                'fullName': fullName,
                'userID': userID,
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: _buildAddressesRow(
                image: ImageConstant.imgFrame1,
                addresses: "lbl_privacy".tr,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventeenColumn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showContactUsEmail("cartouchify@gmail.com");
      },
      child: Container(
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
          ],
        ),
      ),
    );
  }

  Widget _buildAddressesRow({
    required String image,
    required String addresses,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: image,
          height: 23.v,
          width: 24.h,
          margin: EdgeInsets.only(bottom: 3.v),
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.h),
          child: Text(
            addresses,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 23.v,
          width: 24.h,
          margin: EdgeInsets.only(left: 10.h, bottom: 2.v),
        ),
      ],
    );
  }

  Future<void> _showImageSourceBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a picture'),
                onTap: () {
                  _getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () {
                  _getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null && userID.isNotEmpty) {
      final path = "avatars/${userID}_${pickedFile.name}";
      final file = File(pickedFile.path);
      final ref = FirebaseStorage.instance.ref().child(path);

      try {
        // Upload the file to Firebase Storage
        final uploadTask = await ref.putFile(file);

        // Get the download URL
        final downloadURL = await uploadTask.ref.getDownloadURL();

        // Update the avatar URL in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .update({
          'avatarURL': downloadURL,
        });

        // Check if the widget is still mounted before calling setState
        if (mounted) {
          setState(() {
            avatarURL = downloadURL;
          });
        }
      } catch (e) {
        // Handle errors here
        print('Error uploading image: $e');
        // Optionally, you can show a snackbar or dialog to inform the user
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error uploading image: $e')),
          );
        }
      }
    } else if (pickedFile == null) {
      print('No image selected.');
      // Optionally, you can show a snackbar or dialog to inform the user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No image selected.')),
        );
      }
    } else {
      print('User ID is empty.');
      // Optionally, you can show a snackbar or dialog to inform the user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User ID is empty.')),
        );
      }
    }
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/"; // Default route for debugging
    }
  }

  void showContactUsEmail(String message) {
    Get.snackbar("Our email:", message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM);
  }

  void _showImageSourceBottomSheetScan() {
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
                  _openCameraScan();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _openGalleryScan();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _openCameraScan() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      _uploadImage(imageFile);
    }
  }

  void _openGalleryScan() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      _uploadImage(imageFile);
    }
  }

  void _uploadImage(File imageFile) async {
    String url =
        'http://192.168.1.17:5000/predict'; // Replace with your Flask server URL

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
          'description': description,
          'userID': userID,
        });
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
