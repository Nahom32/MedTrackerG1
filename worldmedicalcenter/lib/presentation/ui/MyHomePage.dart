// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:worldmedicalcenter/presentation/ui/hello.dart';

import 'intro_1.dart';
import 'intro_2.dart';
import 'intro_3.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: [
                const IntroductionOne(),
                const IntroductionTwo(),
                IntroductionThree(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0),
              child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                      activeDotColor: Colors.black,
                      dotColor: Colors.black,
                      dotHeight: 5,
                      dotWidth: 5)),
            ),
            Container(
              alignment: const Alignment(0, -0.9),
              child: const Image(
                image: AssetImage(
                    'assets/world-medical-card-removebg-preview.png'),
                height: 40,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: onLastPage
                    ? TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Hello();
                          }));
                        },
                        child: Container(
                          child: const Text(
                            'NEXT',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),

                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 130),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              color: Colors.blue),
                          // color: Colors.blue,
                        )
                        )
                    : GestureDetector(
                        key: const Key("skip"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Hello();
                          }));
                        },
                        child: const Text(
                          // key: ValueKey("skip"),
                          'Skip Tour',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                alignment: Alignment(0, 0.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
