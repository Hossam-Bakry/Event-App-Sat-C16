import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/models/category_data.dart';
import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final bool isSelected;
  final CategoryData categoryData;

  const TabBarItem({
    super.key,
    required this.categoryData,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : ColorPallete.primaryColor,
        borderRadius: BorderRadius.circular(45.0),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        spacing: 8.0,
        children: [
          ImageIcon(
            AssetImage(categoryData.icn),
            color: isSelected ? ColorPallete.primaryColor : Colors.white,
          ),
          Text(
            categoryData.name,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: isSelected ? ColorPallete.primaryColor : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
