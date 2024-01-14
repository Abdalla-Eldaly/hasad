import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/color.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final Widget? icon;
  final String fieldName;

  const CustomTextForm({
    super.key,
    required this.fieldName,
    required this.hintText,
    required this.myController,
    required this.valid,
    required this.maxLines,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              fieldName,
              style: GoogleFonts.tajawal(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          TextFormField(
            maxLines: maxLines,
            validator: valid,
            keyboardType: TextInputType.emailAddress,
            controller: myController,
            decoration: InputDecoration(
              helperText: '',
              suffixIcon: icon,
              hintText: hintText,
              hintStyle: GoogleFonts.tajawal(
                fontSize: 18,
                color: Colors.grey,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: mainColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: const BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
