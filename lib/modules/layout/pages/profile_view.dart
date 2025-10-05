import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:event_app_c16_sat/modules/app_manager/app_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<String> _languageList = ["English", "عربي"];
  final List<String> _themeList = ["Light", "dark"];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    var local = AppLocalizations.of(context)!;
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
            color: ColorPallete.primaryColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65)),
          ),
          child: Row(
            spacing: 10,
            children: [
              Assets.images.routeLogo.image(height: 124),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hossam Bakry",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: provider.isDark() ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    "hossambakry@gmail.com",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: provider.isDark() ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            local.language,
            style: theme.textTheme.titleLarge?.copyWith(
              color: provider.isDark() ? Colors.white : Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomDropdown<String>(
            hintText: 'Select Language',
            items: _languageList,
            initialItem: _languageList[0],
            onChanged: (value) {
              log('changing value to: $value');
              provider.changeLanguage(value == "English" ? "en" : "ar");
            },
            decoration: CustomDropdownDecoration(
              closedFillColor: Colors.transparent,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 30,
                color: ColorPallete.primaryColor,
              ),
              listItemStyle: theme.textTheme.titleLarge?.copyWith(
                color: ColorPallete.primaryColor,
              ),
              headerStyle: theme.textTheme.titleLarge?.copyWith(
                color: ColorPallete.primaryColor,
              ),
              closedBorder: Border.all(color: ColorPallete.primaryColor),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            local.theme,
            style: theme.textTheme.titleLarge?.copyWith(
              color: provider.isDark() ? Colors.white : Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomDropdown<String>(
            hintText: 'Select Theme Mode',
            items: _themeList,
            initialItem: _themeList[0],
            onChanged: (value) {
              log('changing value to: $value');
              provider.changeTheme(
                value == "Light" ? ThemeMode.light : ThemeMode.dark,
              );
            },
            decoration: CustomDropdownDecoration(
              closedFillColor: Colors.transparent,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 30,
                color: ColorPallete.primaryColor,
              ),
              listItemStyle: theme.textTheme.titleLarge?.copyWith(
                color: ColorPallete.primaryColor,
              ),
              headerStyle: theme.textTheme.titleLarge?.copyWith(
                color: ColorPallete.primaryColor,
              ),
              closedBorder: Border.all(color: ColorPallete.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
