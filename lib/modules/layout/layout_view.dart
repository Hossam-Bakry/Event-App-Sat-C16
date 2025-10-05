import 'package:event_app_c16_sat/core/routes/page_routes_name.dart';
import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:event_app_c16_sat/modules/layout/pages/favorites_view.dart';
import 'package:event_app_c16_sat/modules/layout/pages/home_view.dart';
import 'package:event_app_c16_sat/modules/layout/pages/maps_view.dart';
import 'package:event_app_c16_sat/modules/layout/pages/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    MapsView(),
    FavoritesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      floatingActionButton: Bounceable(
        onTap: () {
          Navigator.of(context).pushNamed(PageRoutesName.createEvent);
        },
        child: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 24,
            backgroundColor: ColorPallete.primaryColor,
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.homeIcn.image(height: 26),
            activeIcon: Assets.icons.selectedHomeIcn.image(height: 26),
            label: local.home,
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.mapIcn.image(height: 26),
            activeIcon: Assets.icons.selectedMapIcn.image(height: 26),
            label: local.maps,
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.favoriteIcn.image(height: 26),
            activeIcon: Assets.icons.selectedFavoriteIcn.image(height: 26),
            label: local.favorites,
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.userIcn.image(height: 26),
            activeIcon: Assets.icons.selectedUserIcn.image(height: 26),
            label: local.profile,
          ),
        ],
      ),
    );
  }
}
