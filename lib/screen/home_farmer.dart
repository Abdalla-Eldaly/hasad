import 'package:flutter/material.dart';
import 'package:hased/moduls/i_key.dart';
import 'package:hased/screen/home_component/bar.dart';
import 'package:hased/screen/home_component/custom_card.dart';
import 'package:hased/screen/home_component/weather.dart';
import 'package:hased/widget/custom_text.dart';

class HomeFarmer extends StatefulWidget {
  const HomeFarmer({super.key});

  @override
  State<HomeFarmer> createState() => _HomeFarmerState();
}

class _HomeFarmerState extends State<HomeFarmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer:const HomePageDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarHome(),
              CustomTextWithColumn(
                textOne: TKeys.hi.translate(context),
                textTwo: TKeys.weather.translate(context),
                fontSize: 22,
                axis: CrossAxisAlignment.start,
              ),
              const WeatherWidget(),
              CustomCard(
                titleOne: TKeys.crop.translate(context),
                titleTwo: TKeys.selectCrop.translate(context),
                buttonText: TKeys.clickHere.translate(context),
                function: (){},
                widget: Image.asset(
                  'assets/images/maize.png',
                  color: Colors.white,
                  scale: 7,
                ),
              ),
              CustomCard(
                titleOne: TKeys.prepare.translate(context),
                titleTwo: TKeys.selectType.translate(context),

                buttonText: TKeys.clickHere.translate(context),
                function: (){},
                widget: Icon(Icons.photo_library_outlined,color: Colors.white,size: 70,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
