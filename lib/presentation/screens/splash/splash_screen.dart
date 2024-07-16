import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gatherly/navigation/app_route_paths.dart';

import '../../../utils/app_text_style.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, RoutePaths.homeRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image(image: image)
            Text(
              AppStrings.appName.toUpperCase(),
              style: seymourOneNormal(),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            // Image(image: image)
          ],
        ),
      ),
    );
  }
}
