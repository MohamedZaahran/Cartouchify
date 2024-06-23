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
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                imagePath != null
                    ? Image.file(
                        File(imagePath),
                        height: 300,
                        width: 300,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
