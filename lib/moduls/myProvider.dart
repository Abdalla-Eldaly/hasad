import 'package:flutter/material.dart';
// import '../component/constant.dart';
// import '../screen/home.dart';
// import '../screen/contact_screen.dart';
// import '../screen/profile.dart';

class MyProvider with ChangeNotifier{

  int _currentIndex = 0;

  int item = 0;

  int get currentIndex => _currentIndex;


  List<BottomNavigationBarItem> bottomItems =const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.red,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.connect_without_contact_outlined),
      label: 'Contact Us',
      backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline_rounded),
      label: 'My Account',
      backgroundColor: Colors.purple,
    ),
  ];
  // List<Widget> pages = [
  //   const Home(),
  //   const ContactScreen(),
  //   const ProfileScreen()
  // ];

  void changeBottomNavBar(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}