import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hierosecret/core/app_export.dart';

class ScannedScreen extends StatelessWidget {
  const ScannedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imagePath = Get.arguments['imagePath'];
    final String description = Get.arguments['description'].toString();
    final String userID = Get.arguments['userID'].toString();

    // Check if the necessary arguments are provided
    if (userID.isNotEmpty && imagePath.isNotEmpty && description.isNotEmpty) {
      _saveScanData(userID, imagePath, description);
    } else {
      print(
          'Error: Missing one or more required arguments (userID, imagePath, description)');
    }

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
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              _buildViewStack(),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 45),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      imagePath.isNotEmpty
                          ? Image.file(
                              File(imagePath),
                              height: 300,
                              width: 300,
                            )
                          : Container(),
                      SizedBox(height: 20),
                      Text('Prediction Result:',
                          style: theme?.textTheme?.labelMedium
                              ?.copyWith(fontSize: 28.0)),
                      SizedBox(height: 10),
                      Text(description,
                          style: CustomTextStyles.labelMediumffc18553
                              .copyWith(fontSize: 25.0)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewStack() {
    return SizedBox(
      height: 70.0, // Adjust as necessary
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            color: Color(0xFF543855), // Change color as needed
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 37.0), // Adjust as necessary
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    iconSize: 24.0, // Adjust as necessary
                    padding: EdgeInsets.only(
                        top: 3.0, bottom: 5.0), // Adjust as necessary
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0), // Adjust as necessary
                    child: Text(
                      "Scanned Details", // Title text
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

  Future<void> _saveScanData(
      String userID, String imagePath, String description) async {
    try {
      print('Starting image upload for userID: $userID, imagePath: $imagePath');

      // Upload image to Firebase Storage
      File file = File(imagePath);
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('scanned_images/$userID/$fileName');
      UploadTask uploadTask = storageReference.putFile(file);
      TaskSnapshot storageSnapshot = await uploadTask;
      String imageUrl = await storageSnapshot.ref.getDownloadURL();

      print('Image uploaded successfully. Image URL: $imageUrl');

      // Save scan data to Firestore
      CollectionReference scans = FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('scans');
      await scans.add({
        'image_url': imageUrl,
        'description': description,
        'timestamp': FieldValue.serverTimestamp()
      });

      print('Scan data saved successfully!');
    } catch (e) {
      print('Failed to save scan data: $e');
    }
  }
}
