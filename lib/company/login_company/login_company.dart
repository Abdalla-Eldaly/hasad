import 'package:flutter/material.dart';
import 'package:hased/const/color.dart';
import 'package:hased/moduls/i_key.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_text_form.dart';


class LoginCompany extends StatefulWidget {
  const LoginCompany({super.key});

  @override
  State<LoginCompany> createState() => _LoginCompanyState();
}

class _LoginCompanyState extends State<LoginCompany> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController configPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0, right: 18, left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        TKeys.welcome.translate(context),
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tajawal(
                          color: Theme.of(context).colorScheme.scrim,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        TKeys.registerNow.translate(context),
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tajawal(
                          color: Theme.of(context).colorScheme.scrim,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/group.png',
                    width: 150,
                    height: 170,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70,),
            const Spacer(),
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
            CustomTextForm(
              fieldName: TKeys.configPass.translate(context),
              hintText: TKeys.configPassHint.translate(context),
              myController: configPassword,
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
              height: 40,
            ),
            CustomButton(
              function: () {
                Navigator.pushReplacementNamed(context, '/signInComp');
              },
              title: TKeys.next.translate(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TKeys.noAccount.translate(context),
                  style: GoogleFonts.tajawal(
                    fontSize: 16,
                    color: Colors.black87
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signInComp');
                  },
                  child: Text(
                    TKeys.account.translate(context),
                    style: GoogleFonts.tajawal(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      decoration: TextDecoration.underline,
                      decorationColor: mainColor,
                      decorationThickness: 35.5,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
