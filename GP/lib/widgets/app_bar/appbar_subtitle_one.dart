import 'package:flutter/material.dart';
import 'package:hierosecret/core/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitleOne extends StatelessWidget {
  AppbarSubtitleOne({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.headlineSmallPrimary.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
