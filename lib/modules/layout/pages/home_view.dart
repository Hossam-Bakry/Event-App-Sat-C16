import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/core/utils/firestore_serivces.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:event_app_c16_sat/models/category_data.dart';
import 'package:event_app_c16_sat/models/event_data.dart';
import 'package:event_app_c16_sat/modules/layout/widgets/category_item.dart';
import 'package:event_app_c16_sat/modules/layout/widgets/tab_bar_item.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<CategoryData> categories = [
    CategoryData(
      id: "sport",
      name: "Sport",
      icn: Assets.icons.sportIcn.path,
      image: Assets.images.sportImg.path,
    ),
    CategoryData(
      id: "book_club",
      name: "Book Club",
      icn: Assets.icons.bookClubIcn.path,
      image: Assets.images.bookClubImg.path,
    ),
    CategoryData(
      id: "birthday",
      name: "BirthDay",
      icn: Assets.icons.birthdayIcn.path,
      image: Assets.images.birthdayImg.path,
    ),
    CategoryData(
      id: "eating",
      name: "Eating",
      icn: Assets.icons.sportIcn.path,
      image: Assets.images.eatingImg.path,
    ),
    CategoryData(
      id: "exhibition",
      name: "Exhibition",
      icn: Assets.icons.bookClubIcn.path,
      image: Assets.images.exhibitionImg.path,
    ),
    CategoryData(
      id: "gaming",
      name: "Gaming",
      icn: Assets.icons.birthdayIcn.path,
      image: Assets.images.gamingImg.path,
    ),
    CategoryData(
      id: "meeting",
      name: "Meeting",
      icn: Assets.icons.sportIcn.path,
      image: Assets.images.meetingImg.path,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorPallete.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: SafeArea(
              child: Column(
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Back ✨",
                                  style: theme.textTheme.bodyMedium,
                                ),
                                Text(
                                  "Hossam Bakry",
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  spacing: 6,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Assets.icons.mapIcn.image(height: 24),
                                    Text(
                                      "Cairo, Maadi",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                Icon(
                                  Icons.light_mode_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    "En",
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: ColorPallete.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  DefaultTabController(
                    length: categories.length,
                    child: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      labelPadding: EdgeInsets.symmetric(horizontal: 4),
                      indicator: BoxDecoration(),
                      dividerColor: Colors.transparent,
                      dividerHeight: 0,

                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      tabs:
                          categories.map((element) {
                            return TabBarItem(
                              categoryData: element,
                              isSelected:
                                  _currentIndex == categories.indexOf(element),
                            );
                          }).toList(),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          StreamBuilder(
            stream: FirestoreServices.getStreamOfEvents(
              categories[_currentIndex].id,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorPallete.primaryColor,
                  ),
                );
              }
              List<EventData> eventsList =
                  snapshot.data!.docs.map((element) {
                    return element.data();
                  }).toList();

              return eventsList.isEmpty
                  ? Center(
                    child: Text(
                      "No events Founds",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  )
                  : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemBuilder: (context, index) {
                      return CategoryItem(eventData: eventsList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: eventsList.length,
                  );
            },
          ),

          /*FutureBuilder<List<EventData>>(
            future: FirestoreServices.getAllEvents(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorPallete.primaryColor,
                  ),
                );
              }

              List<EventData> eventList = snapshot.data ?? [];
              return   ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemBuilder: (context, index) {
                  return CategoryItem(eventData: eventList[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: eventList.length,
              );
            },
          ),*/
        ],
      ),
    );
  }
}
