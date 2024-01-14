import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hased/moduls/i_key.dart';
import 'package:hased/splash/slider.dart';

import '../const/color.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewState();
}

class _PageViewState extends State<PageViewScreen> {
  int currentPage = 0;
  PageController controller = PageController();

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 6), (timer) {
      if (currentPage < 3) {
        currentPage++;
      }else{
        Navigator.pushReplacementNamed(context, '/selected');
      }

      controller.animateToPage(
        currentPage,
        duration:const Duration(seconds: 3),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<SliderPage> pages = [
      SliderPage(
        image: 'assets/images/slider1.jpg',
        title: TKeys.title1.translate(context),
        description: TKeys.description1.translate(context),
      ),
      SliderPage(
        image: 'assets/images/slider2.jpg',
        title: TKeys.title2.translate(context),
        description: TKeys.description2.translate(context),
      ),
      SliderPage(
        image: 'assets/images/slider3.jpg',
        title: TKeys.title3.translate(context),
        description: TKeys.description3.translate(context),
      ),
      SliderPage(
        image: 'assets/images/slider4.jpg',
        title: TKeys.title4.translate(context),
        description: TKeys.description4.translate(context),
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: pages.length,
            onPageChanged: onChanged,
            itemBuilder: (ctx, int index) {
              return pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(pages.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 10,
                    width: (index == currentPage) ? 75 : 40,
                    margin: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: (index == currentPage)
                          ? mainColor
                          : const Color.fromRGBO(196, 196, 196, 0.8),
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 21.0, right: 21, bottom: 30, top: 20),
                child: Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/selected', (route) => false);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: mainColor,
                          ),
                        ),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.33, 40),
                      ),
                      child: Text(
                        TKeys.skip.translate(context),
                        style: GoogleFonts.tajawal(
                            fontSize: 22,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: mainColor,
                        ),
                        onPressed: () {
                          if ((currentPage == (pages.length - 1))) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/selected', (route) => false);
                          } else {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOutQuint,
                            );
                          }
                        },
                        child: Text(
                          TKeys.next.translate(context),
                          style: GoogleFonts.tajawal(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
