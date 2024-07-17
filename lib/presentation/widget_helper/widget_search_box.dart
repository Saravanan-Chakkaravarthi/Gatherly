import 'package:flutter/material.dart';

import '../../utils/app_margins.dart';
import '../../utils/app_text_style.dart';
import '../../utils/color_assets.dart';


class SearchWidget extends StatelessWidget {
  final VoidCallback filteredValue;
  const SearchWidget({super.key, required this.filteredValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => filteredValue,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.gray,
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: "Search",
        hintStyle: sfCompactRegular(),
        labelStyle: sfCompactRegular(),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.gray,
              width: AppMargins.dm_01
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.search,
    );
  }
}
