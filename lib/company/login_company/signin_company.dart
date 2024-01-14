import 'package:flutter/material.dart';
import 'package:hased/const/color.dart';
import 'package:hased/moduls/i_key.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_text_form.dart';


class SignInCompany extends StatefulWidget {
  const SignInCompany({super.key});

  @override
  State<SignInCompany> createState() => _SignInCompanyState();
}

class _SignInCompanyState extends State<SignInCompany> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, right: 18, left: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TKeys.back.translate(context),
                  style: GoogleFonts.tajawal(
                    color: Theme.of(context).colorScheme.scrim,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Image.asset(
                  'assets/images/group.png',
                  width: 150,
                  height: 170,
                ),
              ],
            ),
          ),
          Spacer(),
          CustomTextForm(
            fieldName: TKeys.email.translate(context),
            hintText: TKeys.emailHint.translate(context),
            myController: email,
            valid: (value) {
              if (value!.isEmpty) {
                return 'Enter Your Email';
              }
              return null;
            },
            maxLines: 1,
            icon: Icon(
              Icons.email_outlined,
              color: mainColor,
            ),
          ),
          CustomTextForm(
            fieldName: TKeys.password.translate(context),
            hintText: TKeys.passwordHint.translate(context),
            myController: password,
            valid: (value) {
              if (value!.isEmpty) {
                return 'Enter Your Password';
              }
              return null;
            },
            maxLines: 1,
            icon: Icon(
              Icons.visibility_outlined,
              color: mainColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            function: () {
              Navigator.pushReplacementNamed(context, '/registerCompany');
            },
            title: TKeys.next.translate(context),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       TKeys.no.translate(context),
          //       style: GoogleFonts.tajawal(
          //           fontSize: 16,
          //           color: Colors.black87
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () {
          //         Navigator.pushReplacementNamed(context, '/register');
          //       },
          //       child: Text(
          //         TKeys.createAccount.translate(context),
          //         style: GoogleFonts.tajawal(
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold,
          //           color: const Color.fromRGBO(138, 169, 89, 1),
          //           decoration: TextDecoration.underline,
          //           decorationColor: const Color.fromRGBO(138, 169, 89, 1),
          //           decorationThickness: 5,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          const Spacer(),
        ],
      ),
    );
  }
}
