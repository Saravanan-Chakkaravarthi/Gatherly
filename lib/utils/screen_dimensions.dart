import 'dart:ui';

import 'package:flutter/material.dart';

getScreenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

getScreenHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

isMobile(BuildContext context) {
  return getScreenWidth(context) <= 570;
}

isTab(BuildContext context) {
  return getScreenWidth(context) > 570 && getScreenWidth(context) <= 799;
}

isTabForClass(BuildContext context) {
  return getScreenWidth(context) > 570 && getScreenWidth(context) <= 1060;
}

isWeb(BuildContext context) {
  return getScreenWidth(context) > 800;
}

Widget buildVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}
