import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16.fSize,
      );
  static get bodyLargePrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 16.fSize,
      );
  static get bodyLargeRed300 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.red300,
        fontSize: 16.fSize,
      );
  static get bodyLargeRobotoRed300 =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: appTheme.red300,
        fontSize: 16.fSize,
      );
  static get bodyLargeffc18553 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFFC18553),
        fontSize: 16.fSize,
      );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Headline text style
  static get headlineSmallBlack900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black900,
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Inter text style
  static get interBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: 5.fSize,
        fontWeight: FontWeight.w700,
      ).inter;
  // Label text style
  static get labelLarge13 => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
      );
  static get labelLargeGray500 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray500,
      );
  static get labelLargeInter => theme.textTheme.labelLarge!.inter;
  static get labelLargeOnPrimaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargeff543855 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF543855),
        fontSize: 13.fSize,
      );
  static get labelLargeffc18553 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFFC18553),
        fontSize: 13.fSize,
      );
  static get labelMediumffc18553 => theme.textTheme.labelMedium!.copyWith(
        color: Color(0XFFC18553),
      );
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
      );
  static get titleLargeRed300 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.red300,
      );
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get titleMediumRed300 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.red300,
      );
  static get titleMediumff543855 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF543855),
        fontSize: 18.fSize,
      );
  static get titleMediumff543855_1 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF543855),
      );
  static get titleMediumffc18553 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFFC18553),
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
      );
  static get titleSmallInterErrorContainer =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 15.fSize,
      );
  static get titleSmallInterff543855 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: Color(0XFF543855),
        fontSize: 15.fSize,
      );
  static get titleSmallInterffdf2c30 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: Color(0XFFDF2C30),
        fontSize: 15.fSize,
      );
  static get titleSmallffc18553 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFFC18553),
        fontSize: 15.fSize,
      );
}

extension on TextStyle {
  TextStyle get inika {
    return copyWith(
      fontFamily: 'Inika',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
