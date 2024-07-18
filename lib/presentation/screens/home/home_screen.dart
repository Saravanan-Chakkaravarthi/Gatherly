import 'package:flutter/material.dart';
import 'package:gatherly/utils/app_margins.dart';
import 'package:gatherly/utils/color_assets.dart';
import 'package:gatherly/utils/constants.dart';

import '../../../core/data/events_model.dart';
import '../../../utils/app_text_style.dart';
import '../../widget_helper/search_widget.dart';
import '../../widget_helper/stall_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EventsModel> _searchedItems = [];
  ScrollController _controller = ScrollController();
  bool showSearchIcon = false;

  List<EventsModel> eventsModel = [
    EventsModel(
        1,
        "https://img.freepik.com/premium-photo/pretty-girl-with-cup-hot-drink-smiles-forest-autumn_116317-383.jpg",
        "Angelina",
        "10-06-2024",
        "12-06-2024",
        "Chennai",
        "files"),
    EventsModel(
        1,
        "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg",
        "Christina Photography",
        "10-06-2024",
        "12-06-2024",
        "Chennai",
        "files"),
    EventsModel(
        1,
        "https://media.istockphoto.com/id/1191834325/photo/woman-with-index-finger-on-lips-asking-to-be-quiet-or-keep-secret.jpg?s=612x612&w=0&k=20&c=w-5MBbMc8E96QJDY3x3xpXFj5omg5qTI7DLrUtu-UTk=",
        "July ShutUp",
        "10-06-2024",
        "12-06-2024",
        "Chennai",
        "files"),
    EventsModel(
        1,
        "https://media.istockphoto.com/id/1172644005/photo/hihi-little-girl-laughing.jpg?s=612x612&w=0&k=20&c=iQkC9FIiDYLuNgtbJm7JwEddA4SCQilnwGqxvcNuWcw=",
        "Children Laughing",
        "10-06-2024",
        "12-06-2024",
        "Chennai",
        "files")
  ];

  filter(String searchText) {
    List<EventsModel> results = [];
    if (searchText.isEmpty) {
      results = eventsModel;
    } else {
      results = eventsModel
          .where((element) =>
              element.eventName
                  ?.toLowerCase()
                  .contains(searchText.toLowerCase()) ==
              true)
          .toList();
    }
    setState(() {
      _searchedItems = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _searchedItems = eventsModel;
    _controller.addListener(() {
      if (_controller.offset > 20 && !_controller.position.outOfRange) {
        if (!showSearchIcon) {
          showSearchIcon = true;
          setState(() {});
        }
      }
      if (_controller.offset <= 20 && !_controller.position.outOfRange) {
        if (showSearchIcon) {
          showSearchIcon = false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerScrolled) => <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                backgroundColor: AppColors.colorWhite,
                stretch: true,
                pinned: true,
                expandedHeight: 150.0,
                automaticallyImplyLeading: false,
                actions: [
                  Visibility(
                      visible: showSearchIcon,
                      child: IconButton(
                          onPressed: () {
                            scrollToTop();
                          },
                          icon: const Icon(Icons.search))),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const <StretchMode>[
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  titlePadding:
                      const EdgeInsets.only(left: 16.0, top: 6.0, bottom: 6.0),
                  title: Text(
                    AppStrings.stalls,
                    style: sfCompactSemiBold(AppMargins.dm_24),
                  ),
                  background: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                    child: SearchWidget(filteredValue: filter),
                  ),
                ),
              ),
            )
          ],
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                padding:
                    const EdgeInsets.only(top: 60.0, left: 16.0, right: 16.0),
                itemCount: eventsModel.length,
                itemBuilder: (context, index) {
                  return StallItemWidget(event: eventsModel[index]);
                }),
          ),
        ),
      ),
    );
  }

  void scrollToTop() {
    _controller.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
