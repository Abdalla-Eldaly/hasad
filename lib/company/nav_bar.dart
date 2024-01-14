import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hased/company/screen/favorite_company.dart';
import 'package:hased/company/screen/home_company.dart';
import 'package:hased/company/screen/play_store_company.dart';
import 'package:hased/const/color.dart';


class CurvedNavBarCompany extends StatefulWidget {
  const CurvedNavBarCompany({super.key});

  @override
  State<CurvedNavBarCompany> createState() => _CurvedNavBarCompanyState();
}

class _CurvedNavBarCompanyState extends State<CurvedNavBarCompany> {
  List screens = [
    const HomeCompany(),
    const PlayStoreCompany(),
    const FavoriteCompany(),
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
        items: [
          Icon(
            Icons.home_outlined,
            color: mainColor,
            size: 40,
          ),
          Icon(
            Icons.local_grocery_store_outlined,
            size: 40,
            color: mainColor,
          ),
          Icon(
            Icons.favorite_border,
            size: 40,
            color: mainColor,
          ),
        ],
        onTap: (value){
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: screens[selectedIndex],
    );
  }
}
