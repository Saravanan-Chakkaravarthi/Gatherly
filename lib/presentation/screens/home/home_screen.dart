import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> items = ["First Name",
    "Second Name",
    "Third Name",
    "Fourth Name"];
  List<String> _searchedItems = [];

  void filter(String searchText) {
    List<String> results = [];
    if(searchText.isEmpty) {
      results = items;
    } else {
      results = items.where((element) => element.toLowerCase().contains(searchText.toLowerCase())).toList();
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
        body: Column(
          children: [
            TextFormField(onChanged: (value) {
              filter(value);
            }, decoration: const InputDecoration(
                  labelText: "Search",
                  labelStyle: TextStyle(
                      color: Colors.black
                  )
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _searchedItems.length,
                    itemBuilder: (context,index) {
                      final name = _searchedItems[index];
                      return Text(name);
                    })
            )
          ],
        ),
      ),
    );
  }
}

