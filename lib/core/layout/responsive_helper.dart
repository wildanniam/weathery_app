import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveHelper {
  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 360;

  static bool isMediumMobile(BuildContext context) =>
      MediaQuery.of(context).size.width > 360 &&
      MediaQuery.of(context).size.width <= 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 600;

  // Font Sizes
  static double getTitleLarge(BuildContext context) {
    if (isSmallMobile(context)) return 20.sp;
    if (isMediumMobile(context)) return 24.sp;
    return 28.sp;
  }

  static double getTitleMedium(BuildContext context) {
    if (isSmallMobile(context)) return 16.sp;
    if (isMediumMobile(context)) return 18.sp;
    return 20.sp;
  }

  static double getBodyLarge(BuildContext context) {
    if (isSmallMobile(context)) return 14.sp;
    if (isMediumMobile(context)) return 16.sp;
    return 18.sp;
  }

  static double getBodyMedium(BuildContext context) {
    if (isSmallMobile(context)) return 12.sp;
    if (isMediumMobile(context)) return 14.sp;
    return 16.sp;
  }

  static double getBodySmall(BuildContext context) {
    if (isSmallMobile(context)) return 10.sp;
    if (isMediumMobile(context)) return 12.sp;
    return 14.sp;
  }

  // Padding & Margin
  static double getHorizontalPadding(BuildContext context) {
    if (isSmallMobile(context)) return 12.w;
    if (isMediumMobile(context)) return 16.w;
    return 24.w;
  }

  static double getVerticalPadding(BuildContext context) {
    if (isSmallMobile(context)) return 8.h;
    if (isMediumMobile(context)) return 12.h;
    return 16.h;
  }

  static double getCardPadding(BuildContext context) {
    if (isSmallMobile(context)) return 12.w;
    if (isMediumMobile(context)) return 16.w;
    return 24.w;
  }

  static double getSpacing(BuildContext context) {
    if (isSmallMobile(context)) return 8.h;
    if (isMediumMobile(context)) return 12.h;
    return 16.h;
  }

  // Icon Sizes
  static double getIconSize(BuildContext context) {
    if (isSmallMobile(context)) return 20.w;
    if (isMediumMobile(context)) return 24.w;
    return 28.w;
  }

  static double getLargeIconSize(BuildContext context) {
    if (isSmallMobile(context)) return 48.w;
    if (isMediumMobile(context)) return 56.w;
    return 64.w;
  }

  // Card Sizes
  static double getCardBorderRadius(BuildContext context) {
    if (isSmallMobile(context)) return 12.r;
    if (isMediumMobile(context)) return 16.r;
    return 24.r;
  }

  static double getCardElevation(BuildContext context) {
    if (isSmallMobile(context)) return 2;
    if (isMediumMobile(context)) return 4;
    return 6;
  }

  // Button Sizes
  static double getButtonHeight(BuildContext context) {
    if (isSmallMobile(context)) return 36.h;
    if (isMediumMobile(context)) return 40.h;
    return 48.h;
  }

  static double getButtonPadding(BuildContext context) {
    if (isSmallMobile(context)) return 12.w;
    if (isMediumMobile(context)) return 16.w;
    return 24.w;
  }

  // Weather Card Specific
  static double getWeatherCardHeight(BuildContext context) {
    if (isSmallMobile(context)) return 180.h;
    if (isMediumMobile(context)) return 220.h;
    return 280.h;
  }

  static double getWeatherIconSize(BuildContext context) {
    if (isSmallMobile(context)) return 48.w;
    if (isMediumMobile(context)) return 56.w;
    return 64.w;
  }

  static double getTemperatureFontSize(BuildContext context) {
    if (isSmallMobile(context)) return 36.sp;
    if (isMediumMobile(context)) return 48.sp;
    return 64.sp;
  }

  // Forecast Card Specific
  static double getForecastCardHeight(BuildContext context) {
    if (isSmallMobile(context)) return 80.h;
    if (isMediumMobile(context)) return 100.h;
    return 120.h;
  }

  static double getForecastIconSize(BuildContext context) {
    if (isSmallMobile(context)) return 20.w;
    if (isMediumMobile(context)) return 24.w;
    return 28.w;
  }

  // Mini Card Specific
  static double getMiniCardWidth(BuildContext context) {
    if (isSmallMobile(context)) return 80.w;
    if (isMediumMobile(context)) return 100.w;
    return 120.w;
  }

  static double getMiniCardHeight(BuildContext context) {
    if (isSmallMobile(context)) return 80.h;
    if (isMediumMobile(context)) return 100.h;
    return 120.h;
  }

  static double getMiniCardIconSize(BuildContext context) {
    if (isSmallMobile(context)) return 20.w;
    if (isMediumMobile(context)) return 24.w;
    return 28.w;
  }
}
