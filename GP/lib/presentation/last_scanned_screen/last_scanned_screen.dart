import '../last_scanned_screen/widgets/cardcomponent_item_widget.dart';
import 'controller/last_scanned_controller.dart';
import 'models/cardcomponent_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/app_bar/appbar_leading_image.dart';
import 'package:hierosecret/widgets/app_bar/appbar_title.dart';
import 'package:hierosecret/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class LastScannedScreen extends GetWidget<LastScannedController> {
  const LastScannedScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          padding: EdgeInsets.only(top: 90.v),
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgOnboarding,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 31.h,
              top: 48.v,
              right: 31.h,
            ),
            child: Obx(
              () => ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return SizedBox(
                    height: 20.v,
                  );
                },
                itemCount: controller.lastScannedModelObj.value
                    .cardcomponentItemList.value.length,
                itemBuilder: (context, index) {
                  CardcomponentItemModel model = controller.lastScannedModelObj
                      .value.cardcomponentItemList.value[index];
                  return CardcomponentItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 53.h,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Get.back();
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_last_scanned".tr,
        margin: EdgeInsets.only(top: 48.v),
      ),
      styleType: Style.bgFill,
    );
  }
}
