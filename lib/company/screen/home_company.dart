import 'package:flutter/material.dart';

class HomeCompany extends StatefulWidget {
  const HomeCompany({super.key});

  @override
  State<HomeCompany> createState() => _HomeCompanyState();
}

class _HomeCompanyState extends State<HomeCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer:const HomePageDrawer(),
      appBar: AppBar(),
      body: Container(
        color: Colors.teal,
      ),
    );
  }
}
