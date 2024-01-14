import 'package:flutter/material.dart';
import '../moduls/i_key.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/custom_button.dart';

class SelectedItem extends StatefulWidget {
  const SelectedItem({super.key});

  @override
  State<SelectedItem> createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Image.asset(
                'assets/images/selected.jpg',
                scale: 0.6,
                fit: BoxFit.fitHeight,
                height: 250,
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Text(
              TKeys.choose.translate(context),
              textAlign: TextAlign.center,
              style: GoogleFonts.tajawal(
                color: Theme.of(context).colorScheme.scrim,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomButton(
                function: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/register', (route) => false);
                },
                title: TKeys.farmer.translate(context),
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomButton(
                function: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/loginComp', (route) => false);
                },
                title: TKeys.companies.translate(context),
              ),
            ),
            const Spacer(),
            Text(
              TKeys.note.translate(context),
              textAlign: TextAlign.center,
              style: GoogleFonts.tajawal(
                color: Theme.of(context).colorScheme.scrim,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
