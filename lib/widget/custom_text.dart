import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWithColumn extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final double fontSize;
  final CrossAxisAlignment axis;

  const CustomTextWithColumn(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.fontSize, required this.axis,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: axis,
        children: [
          Text(
            textOne,
            //textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              color: Theme.of(context).colorScheme.scrim,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            textTwo,
            //textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              color: Theme.of(context).colorScheme.scrim,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
