import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/models/category_data.dart';
import 'package:flutter/material.dart';

class CreateTabBarItem extends StatelessWidget {
  final bool isSelected;
  final CategoryData categoryData;

  const CreateTabBarItem({
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
        color: isSelected ? ColorPallete.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(45.0),
        border: Border.all(color: ColorPallete.primaryColor),
      ),
      child: Row(
        spacing: 8.0,
        children: [
          ImageIcon(
            AssetImage(categoryData.icn),
            color: isSelected ? Colors.white : ColorPallete.primaryColor,
          ),
          Text(
            categoryData.name,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: isSelected ? Colors.white : ColorPallete.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
