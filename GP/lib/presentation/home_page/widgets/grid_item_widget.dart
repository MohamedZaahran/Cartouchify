import '../controller/home_controller.dart';
import '../models/grid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ignore: must_be_immutable
class GridItemWidget extends StatelessWidget {
  GridItemWidget(
    this.gridItemModelObj, {
    Key? key,
    this.onTapTwentySix,
  }) : super(
          key: key,
        );

  GridItemModel gridItemModelObj;

  var controller = Get.find<HomeController>();

  VoidCallback? onTapTwentySix;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapTwentySix!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.v),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => CustomImageView(
                imagePath: gridItemModelObj.nameGeneratorImage!.value,
                height: 100.v,
                width: 155.h,
                radius: BorderRadius.vertical(
                  top: Radius.circular(20.h),
                ),
              ),
            ),
            SizedBox(height: 13.v),
            Obx(
              () => Text(
                gridItemModelObj.nameGeneratorText!.value,
                style: theme.textTheme.titleSmall,
              ),
            ),
            SizedBox(height: 13.v),
          ],
        ),
      ),
    );
  }
}
