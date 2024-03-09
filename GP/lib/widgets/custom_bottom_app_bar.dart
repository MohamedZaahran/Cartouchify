import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  final Function(BottomBarEnum)? onChanged;

  const CustomBottomAppBar({Key? key, this.onChanged}) : super(key: key);

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  late bool home;
  late RxList<BottomMenuModel> bottomMenuList;

  @override
  void initState() {
    super.initState();
    home = true;
    bottomMenuList = [
      BottomMenuModel(
        icon: ImageConstant.imgNounHome6503544,
        activeIcon: ImageConstant.imgNounHome6503544,
        title: "Home".tr,
        type: BottomBarEnum.Home,
      ),
      BottomMenuModel(
        icon: ImageConstant.imgNounPharoh327820,
        activeIcon: ImageConstant.imgNounPharoh327820,
        title: "Profile".tr,
        type: BottomBarEnum.Profile,
      ),
    ].obs;
  }

  void setSelected(BottomBarEnum type) {
    setState(() {
      home = type == BottomBarEnum.Home;
    });
  }

  @override
  void didUpdateWidget(covariant CustomBottomAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update the home state based on the onChanged callback
    home = widget.onChanged == null ||
        widget.onChanged!(BottomBarEnum.Home) == BottomBarEnum.Home;
  }

  @override
  Widget build(BuildContext context) {
    print("HOME = $home");
    bottomMenuList[0].isSelected = !home;
    bottomMenuList[1].isSelected = home;
    bottomMenuList.refresh();

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
                      setSelected(bottomMenuList[index].type);
                      widget.onChanged?.call(bottomMenuList[index].type);
                      bottomMenuList.refresh();
                    },
                    child: bottomMenuList[index].isSelected
                        ? SizedBox(
                            height: 46.v,
                            width: 45.h,
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
                                  width: 35.h,
                                  color: theme.colorScheme.primary,
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.only(
                                    left: 8.h,
                                    right: 9.h,
                                    bottom: 11.v,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 45.v,
                            width: 45.h,
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
                                  width: 32.h,
                                  color: appTheme.red300,
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.only(
                                    left: 8.h,
                                    right: 7.h,
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
      padding: EdgeInsets.all(15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
