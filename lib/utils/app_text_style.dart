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

TextStyle sfCompactRegular() => const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppColors.gray,
      fontSize: AppMargins.dm_16,
    );

TextStyle jostSemiBold() => const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: AppColors.colorBlack,
    );
