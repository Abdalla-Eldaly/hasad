import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const SliderPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 247, 238, 1),
      body: SafeArea(
        //minimum:const EdgeInsets.symmetric(vertical: 21),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Image(image: AssetImage(image),),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style:GoogleFonts.tajawal(
                  letterSpacing: 0.7,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                description,
                style: GoogleFonts.tajawal(
                  height: 1.5,
                  letterSpacing: 0.9,
                  fontSize: 20,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
