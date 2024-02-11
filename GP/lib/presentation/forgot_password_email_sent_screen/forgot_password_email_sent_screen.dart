import 'controller/forgot_password_email_sent_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:hierosecret/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordEmailSentScreen
    extends GetWidget<ForgotPasswordEmailSentController> {
  const ForgotPasswordEmailSentScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgOnboarding,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 53.h,
              vertical: 111.v,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 23.v),
                Container(
                  height: 243.v,
                  width: 198.h,
                  padding: EdgeInsets.only(top: 91.v),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: fs.Svg(
                        ImageConstant.imgVector,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmark,
                    height: 38.v,
                    width: 51.h,
                    alignment: Alignment.topCenter,
                  ),
                ),
                SizedBox(height: 86.v),
                SizedBox(
                  width: 286.h,
                  child: Text(
                    "msg_email_sent_successfully".tr,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Spacer(),
                Container(
                  width: 280.h,
                  margin: EdgeInsets.only(right: 5.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "msg_if_you_faced_any2".tr,
                          style: CustomTextStyles.bodyLargeffc18553,
                        ),
                        TextSpan(
                          text: "lbl_click_here".tr,
                          style:
                              CustomTextStyles.titleMediumff543855_1.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
