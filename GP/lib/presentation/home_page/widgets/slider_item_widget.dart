import '../controller/home_controller.dart';
import '../models/slider_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ignore: must_be_immutable
class SliderItemWidget extends StatelessWidget {
  SliderItemWidget(
    this.sliderItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SliderItemModel sliderItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 153.v,
      width: 320.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 152.v,
              width: 320.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: sliderItemModelObj.imagePath,
                    height: 152.v,
                    width: 320.h,
                    radius: BorderRadius.circular(
                      20.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.h, 78.v, 13.h, 71.v),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgArrow1,
                            height: 3.v,
                            width: 1.h,
                            radius: BorderRadius.circular(
                              1.h,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgArrow2,
                            height: 3.v,
                            width: 1.h,
                            radius: BorderRadius.circular(
                              1.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 150.v,
              width: 320.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
