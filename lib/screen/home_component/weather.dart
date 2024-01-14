import 'package:flutter/material.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.asset('assets/images/weather.jpg',scale: 0.5),
          ),
        ],
      ),
    );
  }
}
