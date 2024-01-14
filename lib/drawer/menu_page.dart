import 'package:flutter/material.dart';

import 'menu_item.dart';

class MenuItems {
  static const payment = MenuItemB("Payment", Icons.payment);
  static const promos = MenuItemB("Promos", Icons.card_giftcard);
  static const notifications = MenuItemB("Notifications", Icons.notification_add);
  static const help = MenuItemB("Help", Icons.help);
  static const aboutUs = MenuItemB("AboutUs", Icons.info_outline);
  static const quran = MenuItemB("Quran", Icons.star_border);

  static final all = <MenuItemB> [
    payment,
    promos,
    notifications,
    help,
    aboutUs,
    quran,
  ];
}

class MenuPage extends StatelessWidget {
  final MenuItemB currentItem;
  final ValueChanged<MenuItemB> onSelectedItem;

  const MenuPage({
    super.key,
    required this.currentItem,
    required this.onSelectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.indigo.shade700,
                    radius: 45,
                    child: Icon(
                      Icons.people,
                      color: Colors.tealAccent.shade400,
                      size: 50,
                    ),
                  ),
                  Text("data"),
                ],
              ),
              Spacer(),
              ...MenuItems.all.map(buildMenuItem).toList(),
               const Spacer(
                flex: 2,
              ),
              IconButton(
                  onPressed: (){},
                icon: Icon(Icons.login_rounded),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItemB itemB) => ListTile(
        selected: currentItem == itemB,
        selectedTileColor: Colors.black26,
        minLeadingWidth: 20,
        leading: Icon(itemB.icon),
        title: Text(itemB.title),
        onTap: () => onSelectedItem(itemB),
      );
}
