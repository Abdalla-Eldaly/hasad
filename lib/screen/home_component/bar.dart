import 'package:flutter/material.dart';
import 'package:hased/company/screen/home_company.dart';

import '../../const/color.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
              vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: mainColor,
          ),
          width: 45,
          height: 45,
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> HomeCompany()));
            },
            child: Icon(
              Icons.list_outlined,
              size: 40,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: mainColor,
              ),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 40,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            const CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ],
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
            width: MediaQuery.of(context).size.width*0.6,
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  child: Text('hello'),
                )
              ],
            ),
          );
  }
}
