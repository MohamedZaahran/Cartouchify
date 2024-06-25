import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/scanned_controller.dart';
import 'package:hierosecret/core/app_export.dart';

class ScannedScreen extends GetWidget<ScannedController> {
  const ScannedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imagePath = Get.arguments['imagePath'];
    final int predictedClassIndex = Get.arguments['predicted_class_index'];
    final String description = Get.arguments['description'].toString();

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
                          style: theme.textTheme.titleLarge),
                      SizedBox(height: 10),
                      Text(description, style: theme.textTheme.bodyLarge),
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
}
