import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hased/moduls/i_key.dart';
import 'package:hased/screen/favorite.dart';
import 'package:hased/screen/home_farmer.dart';
import 'package:hased/screen/play_store.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}


class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData> [
    Icons.home_filled,
    Icons.local_grocery_store,
    Icons.favorite_border,
    //Icons.people,
  ];

  @override
  void initState() {
    super.initState();
    // final systemTheme = SystemUiOverlayStyle.light.copyWith(
    //   systemNavigationBarColor:const Color.fromRGBO(6,45,91, 0.8),
    //   systemNavigationBarIconBrightness: Brightness.dark,
    // );
    //SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _fabAnimationController = AnimationController(
      duration:const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration:const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve:const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve:const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(borderRadiusCurve,);

    _hideBottomBarAnimationController = AnimationController(
      duration:const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
          () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
          () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  List screen = [
    HomeFarmer(),
    Favorite(),
    PlayStore()
  ];
  @override
  Widget build(BuildContext context) {
    final listTitle =<String> [
      TKeys.home.translate(context),
      TKeys.playStore.translate(context),
      TKeys.favorite.translate(context),
    ];
    return Scaffold(
      extendBody: true,
      body: NotificationListener<ScrollNotification>(
        onNotification: onScrollNotification,
        child: screen[_bottomNavIndex],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.orange.shade200,
      //   child:const Icon(
      //     Icons.search,
      //     color: Colors.black,
      //     size: 40,
      //   ),
      //   onPressed: () {
      //     _fabAnimationController.reset();
      //     _borderRadiusAnimationController.reset();
      //     _borderRadiusAnimationController.forward();
      //     _fabAnimationController.forward();
      //   },
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? const Color.fromRGBO(6,45,91, 0.8) : const Color.fromRGBO(138, 169, 89, 1);
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  listTitle[index],
                  maxLines: 1,
                  style: TextStyle(color: color),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        splashColor: const Color.fromRGBO(138, 169, 89, 1),
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.sharpEdge,
        gapLocation: GapLocation.none,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        hideAnimationController: _hideBottomBarAnimationController,
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}