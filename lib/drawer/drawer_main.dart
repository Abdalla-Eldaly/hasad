import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hased/drawer/payment_page.dart';
import 'menu_item.dart';
import 'menu_page.dart';

class HomePageDrawer extends StatefulWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  State<HomePageDrawer> createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  MenuItemB currentItem = MenuItems.payment;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      //style: DrawerStyle.style4,
      borderRadius: 60,
      angle: -1,
      slideWidth: MediaQuery.of(context).size.width * 0.8,
      //mainScreenOverlayColor: Colors.tealAccent,
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.orangeAccent,
      menuBackgroundColor: Colors.indigo,
      menuScreen: Builder(builder: (context) {
        return MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
              });
              ZoomDrawer.of(context)!.close();
            });
      }),
      mainScreen: getScreen(),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.payment:
        return const PaymentPage();
      case MenuItems.help:
        return const HelpPage();
      case MenuItems.notifications:
        return const NotificationsPage();
      case MenuItems.promos:
        return const PromosPage();
    }
    return const HomePageDrawer();
  }
}
