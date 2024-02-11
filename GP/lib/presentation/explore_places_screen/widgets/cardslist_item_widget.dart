import '../controller/explore_places_controller.dart';
import '../models/cardslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ignore: must_be_immutable
class CardslistItemWidget extends StatelessWidget {
  CardslistItemWidget(
    this.cardslistItemModelObj, {
    Key? key,
    this.onTapCards,
  }) : super(
          key: key,
        );

  CardslistItemModel cardslistItemModelObj;

  var controller = Get.find<ExplorePlacesController>();

  VoidCallback? onTapCards;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCards!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 17.v,
        ),
        decoration: AppDecoration.outlineRed300.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomImageView(
              imagePath: ImageConstant.img12024919911911,
              height: 77.v,
              width: 93.h,
              radius: BorderRadius.circular(
                20.h,
              ),
              margin: EdgeInsets.symmetric(vertical: 2.v),
            ),
            Padding(
              padding: EdgeInsets.only(top: 21.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 165.h,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_name2".tr,
                            style: theme.textTheme.labelMedium,
                          ),
                          TextSpan(
                            text: "msg_grand_egyptian_museum".tr,
                            style: CustomTextStyles.labelMediumffc18553,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    width: 188.h,
                    child: Obx(
                      () => Text(
                        cardslistItemModelObj.about!.value,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
