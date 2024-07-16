import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<String> _searchedItems = [];

  List<String> get searchedItems => _searchedItems;

  set searchedItems(List<String> value) {
    _searchedItems = value;
  }
}