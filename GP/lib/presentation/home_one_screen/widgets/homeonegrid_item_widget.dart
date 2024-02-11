import '../controller/home_one_controller.dart';
import '../models/homeonegrid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ignore: must_be_immutable
class HomeonegridItemWidget extends StatelessWidget {
  HomeonegridItemWidget(
    this.homeonegridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HomeonegridItemModel homeonegridItemModelObj;

  var controller = Get.find<HomeOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 21.v,
      ),
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 86.v),
          Obx(
            () => Text(
              homeonegridItemModelObj.dynamicText!.value,
              style: CustomTextStyles.titleMediumBlack900,
            ),
          ),
        ],
      ),
    );
  }
}
