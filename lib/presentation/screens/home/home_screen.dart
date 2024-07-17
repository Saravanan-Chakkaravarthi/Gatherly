import 'package:flutter/material.dart';
import 'package:gatherly/utils/app_margins.dart';
import 'package:gatherly/utils/color_assets.dart';

import '../../../utils/app_text_style.dart';
import '../../widget_helper/widget_search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [
    "First Name",
    "Second Name",
    "Third Name",
    "Fourth Name"
  ];
  List<String> _searchedItems = [];

  void filter(String searchText) {
    List<String> results = [];
    if (searchText.isEmpty) {
      results = items;
    } else {
      results = items
          .where((element) =>
              element.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    setState(() {
      _searchedItems = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _searchedItems = items;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        body: Padding(
          padding: const EdgeInsets.all(AppMargins.dm_18),
          child: Column(
            children: [
              SearchWidget(filter()),
              Expanded(
                  child: ListView.builder(
                      itemCount: _searchedItems.length,
                      itemBuilder: (context, index) {
                        final name = _searchedItems[index];
                        return Text(name);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
