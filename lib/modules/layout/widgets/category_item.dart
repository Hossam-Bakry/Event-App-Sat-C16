import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/core/utils/firestore_serivces.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:event_app_c16_sat/models/category_data.dart';
import 'package:event_app_c16_sat/models/event_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class CategoryItem extends StatelessWidget {
  final EventData eventData;

  const CategoryItem({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 190,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: ColorPallete.primaryColor),
        image: DecorationImage(
          image: AssetImage(eventData.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFFF2FEFF),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              DateFormat("dd MMM").format(eventData.selectedDate!),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: ColorPallete.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.2,
                letterSpacing: 0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFFF2FEFF),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              spacing: 20,
              children: [
                Expanded(
                  child: Text(
                    eventData.title,
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                Bounceable(
                  onTap: () {
                    eventData.isFavorite = !eventData.isFavorite;
                    EasyLoading.show();
                    FirestoreServices.updateEvent(eventData).then((value) {
                      EasyLoading.dismiss();
                    });
                  },
                  child: Icon(
                    eventData.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: ColorPallete.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
