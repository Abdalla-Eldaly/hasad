import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/color.dart';

class ManuItemNav extends StatelessWidget {
  const ManuItemNav({
    super.key,
    required this.title,
    required this.iconData,
  });

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          color: mainColor,
          size: 25,
        ),
        Text(
          title,
          style: GoogleFonts.tajawal(
            color: mainColor,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
