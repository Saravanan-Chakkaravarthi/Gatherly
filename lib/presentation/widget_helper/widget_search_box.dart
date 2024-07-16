import 'package:flutter/material.dart';

class WidgetSearchBox extends StatefulWidget {
  final String hintText;
  const WidgetSearchBox({super.key, required this.hintText});

  @override
  State<WidgetSearchBox> createState() => _WidgetSearchBoxState();
}

class _WidgetSearchBoxState extends State<WidgetSearchBox> {
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
    return TextFormField(
      onChanged: (value) {
        filter(value);
      },
      decoration: InputDecoration(
          labelText: widget.hintText, labelStyle: TextStyle(color: Colors.black)),
    );
  }
}
/*
Expanded(
child: ListView.builder(
itemCount: _searchedItems.length,
itemBuilder: (context, index) {
final name = _searchedItems[index];
return Text(name);
}))*/
