import 'controller/name_generator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/app_bar/appbar_leading_image.dart';
import 'package:hierosecret/widgets/app_bar/custom_app_bar.dart';
import 'package:hierosecret/widgets/custom_outlined_button.dart';
import 'package:hierosecret/widgets/custom_text_form_field.dart';

class NameGeneratorScreen extends StatelessWidget {
  const NameGeneratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NameGeneratorController>(
      init: NameGeneratorController(), // Initialize the controller
      builder: (controller) => SafeArea(
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
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
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildNameGeneratorStack(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 21.h, vertical: 38.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 290.h,
                          margin: EdgeInsets.only(left: 9.h, right: 51.h),
                          child: Text(
                            "Enter name to generate".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(height: 10.v),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 75.v,
                            width: 301.h,
                            child: Stack(
                              children: [
                                CustomTextFormField(
                                  width: 301.h,
                                  controller:
                                      controller.nameGeneratorValueController,
                                  hintText: "Enter your name".tr,
                                  textInputAction: TextInputAction.done,
                                  alignment: Alignment.bottomCenter,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 28.h, vertical: 14.v),
                                ),
                                SizedBox(height: 10.v),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 4.h,
                                    ),
                                    child: Text(
                                      "Name".tr,
                                      style: theme.textTheme.titleSmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.v),
                        CustomOutlinedButton(
                          width: 213.h,
                          text: "lbl_generate".tr,
                          alignment: Alignment.center,
                          onPressed: () {
                            controller.generateSymbols();
                          },
                        ),
                        SizedBox(height: 8.v),
                        Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text(
                            "msg_your_name_in_heiroglyphics".tr,
                            style: CustomTextStyles.titleLargeRed300,
                          ),
                        ),
                        SizedBox(height: 2.v),
                        Container(
                          height: 371.v,
                          width: 350.h,
                          decoration: BoxDecoration(
                            color: Color(
                                0xFF543855), // Set background color to #543855
                          ),
                          alignment: Alignment.center,
                          child: Obx(
                            () => Text(
                              controller.mappedSymbols.value,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.yellow, // Set text color to gold
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "msg_for_dictionary_more2".tr,
                                  style: CustomTextStyles.labelLargeffc18553,
                                ),
                                TextSpan(
                                  text: "lbl_click_here".tr,
                                  style: CustomTextStyles.labelLargeff543855
                                      .copyWith(
                                          decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 5.v),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameGeneratorStack() {
    return SizedBox(
      height: 90.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBar(
            leadingWidth: double.maxFinite,
            styleType: Style.bgFill,
          ),
          Positioned(
            top: 30,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "lbl_name_generator".tr,
              style: theme.textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }
}
