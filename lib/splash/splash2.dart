import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hased/splash/pageview.dart';
import 'package:hased/widget/curved_nav_bar.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        duration:const Duration(seconds: 4),
        backgroundColor: const Color.fromRGBO(248, 247, 238, 1),
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 1.2,
                child: Image.asset(
                  'assets/images/image.png',
                  scale: 0.7,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: const BoxDecoration(
                  //color: Colors.red
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/hasad_logo.png',
                    scale: 0.9,
                  ),
                ),
              )
            ],
          ),
        ),
        onAnimationEnd: () => debugPrint("On Fade In End"),
        nextScreen:const PageViewScreen(),
      ),
    );
  }
}
