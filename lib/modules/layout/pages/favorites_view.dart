import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/core/utils/firestore_serivces.dart';
import 'package:event_app_c16_sat/core/widgets/custom_text_form_filed.dart';
import 'package:event_app_c16_sat/models/event_data.dart';
import 'package:event_app_c16_sat/modules/layout/widgets/category_item.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomTextFormFiled(
              hintText: "Search for events",
              prefixIcon: Icon(Icons.search),
            ),
          ),
          StreamBuilder(
            stream: FirestoreServices.getStreamOfFavoritesEvents(),
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
                      "No favorites",
                      style: theme.textTheme.headlineLarge,
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
        ],
      ),
    );
  }
}
