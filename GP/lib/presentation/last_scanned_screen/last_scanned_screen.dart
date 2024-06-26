import 'controller/last_scanned_controller.dart';
import 'models/cardcomponent_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/widgets/app_bar/appbar_title.dart';
import 'package:hierosecret/widgets/app_bar/custom_app_bar.dart';
import 'widgets/cardcomponent_item_widget.dart';

class LastScannedScreen extends GetWidget<LastScannedController> {
  const LastScannedScreen({Key? key}) : super(key: key);

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
              image: AssetImage(ImageConstant.imgOnboarding),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 31.h, top: 48.v, right: 31.h),
            child: _buildScansList(context),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 53.h,
      leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    iconSize: 24.v,
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 3.v, bottom: 13.v),
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

  Widget _buildScansList(BuildContext context) {
    return Obx(
      () {
        if (controller.scannedList.isEmpty) {
          return Center(
            child: Text(
              'No scans found',
              style: theme.textTheme.bodyLarge,
            ),
          );
        } else {
          // Reverse the scannedList to display newer scans at the top
          final reversedList = controller.scannedList.reversed.toList();
          return ListView.builder(
            itemCount: reversedList.length,
            itemBuilder: (context, index) {
              CardcomponentItemModel model = reversedList[index];
              return CardComponentItemWidget(model: model); // Corrected here
            },
          );
        }
      },
    );
  }
}
