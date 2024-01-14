import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hased/moduls/i_key.dart';
import 'package:hased/screen/favorite.dart';
import 'package:hased/screen/home_farmer.dart';
import 'package:hased/screen/play_store.dart';

import 'custom_nav_bar_menu_item.dart';

class CurvedNavBar extends StatefulWidget {
  const CurvedNavBar({super.key});

  @override
  State<CurvedNavBar> createState() => _CurvedNavBarState();
}

class _CurvedNavBarState extends State<CurvedNavBar> {
  List screens = [
    const HomeFarmer(),
    const PlayStore(),
    const Favorite(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: const Color.fromRGBO(248, 247, 238, 1),
        backgroundColor: Colors.transparent,
        index: selectedIndex,
        height: 55,
        items: [
          ManuItemNav(
            title: TKeys.home.translate(context),
            iconData: Icons.home_outlined,
          ),
          ManuItemNav(
            title: TKeys.playStore.translate(context),
            iconData: Icons.local_grocery_store_outlined,
          ),
          ManuItemNav(
            title: TKeys.favorite.translate(context),
            iconData: Icons.favorite_border,
          ),
        ],
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: screens[selectedIndex],
    );
  }
}
