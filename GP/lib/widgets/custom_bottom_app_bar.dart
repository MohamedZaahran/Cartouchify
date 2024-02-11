import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

class CustomBottomAppBar extends StatelessWidget {
  CustomBottomAppBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxList<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgNounHome6503544,
        activeIcon: ImageConstant.imgNounHome6503544,
        title: "lbl_home".tr,
        type: BottomBarEnum.Home,
        isSelected: true),
    BottomMenuModel(
      icon: ImageConstant.imgNounPharoh327820,
      activeIcon: ImageConstant.imgNounPharoh327820,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    )
  ].obs;

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.h),
          topRight: Radius.circular(15.h),
          bottomLeft: Radius.circular(10.h),
          bottomRight: Radius.circular(10.h),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: appTheme.gray50,
          child: SizedBox(
            height: 32.v,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                bottomMenuList.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      for (var element in bottomMenuList) {
                        element.isSelected = false;
                      }
                      bottomMenuList[index].isSelected = true;
                      onChanged?.call(bottomMenuList[index].type);
                      bottomMenuList.refresh();
                    },
                    child: bottomMenuList[index].isSelected
                        ? SizedBox(
                            height: 46.v,
                            width: 37.h,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30.v),
                                    child: Text(
                                      bottomMenuList[index].title ?? "",
                                      style: CustomTextStyles.labelLargePrimary
                                          .copyWith(
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomImageView(
                                  imagePath: bottomMenuList[index].activeIcon,
                                  height: 35.v,
                                  width: 28.h,
                                  color: theme.colorScheme.primary,
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.only(
                                    left: 4.h,
                                    right: 5.h,
                                    bottom: 11.v,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 45.v,
                            width: 33.h,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 29.v),
                                    child: Text(
                                      bottomMenuList[index].title ?? "",
                                      style:
                                          theme.textTheme.labelLarge!.copyWith(
                                        color: appTheme.red300,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomImageView(
                                  imagePath: bottomMenuList[index].icon,
                                  height: 32.v,
                                  width: 26.h,
                                  color: appTheme.red300,
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.only(
                                    left: 4.h,
                                    right: 3.h,
                                    bottom: 13.v,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
