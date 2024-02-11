import '../controller/last_scanned_controller.dart';
import '../models/cardcomponent_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ignore: must_be_immutable
class CardcomponentItemWidget extends StatelessWidget {
  CardcomponentItemWidget(
    this.cardcomponentItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CardcomponentItemModel cardcomponentItemModelObj;

  var controller = Get.find<LastScannedController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 18.v,
      ),
      decoration: AppDecoration.outlineRed300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage4280x87,
            height: 80.v,
            width: 87.h,
            radius: BorderRadius.circular(
              20.h,
            ),
            margin: EdgeInsets.only(top: 1.v),
          ),
          Container(
            height: 46.v,
            width: 163.h,
            margin: EdgeInsets.only(
              left: 16.h,
              top: 20.v,
              bottom: 13.v,
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Obx(
                    () => Text(
                      cardcomponentItemModelObj.placeName!.value,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Obx(
                    () => Text(
                      cardcomponentItemModelObj.date!.value,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 44.v,
                    width: 129.h,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: 127.h,
                            child: Obx(
                              () => Text(
                                cardcomponentItemModelObj.museumName!.value,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodySmallPrimary,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Obx(
                            () => Text(
                              cardcomponentItemModelObj.museumDate!.value,
                              style: CustomTextStyles.bodySmallPrimary,
                            ),
                          ),
                        ),
                      ],
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
}
