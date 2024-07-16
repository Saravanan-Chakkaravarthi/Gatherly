import 'package:flutter/material.dart';
import 'package:gatherly/utils/app_margins.dart';

import 'color_assets.dart';

// styles
TextStyle seymourOneNormal() => const TextStyle().copyWith(
    fontFamily: 'SeymourOne',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppColors.colorBlack,
    fontSize: AppMargins.dm_30,

);

TextStyle jostMedium() => const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: AppColors.colorBlack,
    );

TextStyle jostSemiBold() => const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: AppColors.colorBlack,
    );
