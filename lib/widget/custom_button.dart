import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hased/const/color.dart';

class CustomButton extends StatelessWidget {
  final void Function() function;
  final String title;

  const CustomButton({super.key, required this.function, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            minimumSize: Size(MediaQuery.of(context).size.width, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        onPressed: function,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.tajawal(
            fontWeight: FontWeight.w900,
            fontSize: 23,
            letterSpacing: 1,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
