import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:worldmedicalcenter/ui/hello.dart';
import 'package:worldmedicalcenter/ui/intro_1.dart';
import 'package:worldmedicalcenter/ui/intro_2.dart';
import 'package:worldmedicalcenter/ui/intro_3.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              IntroductionOne(),
              IntroductionTwo(),
              IntroductionThree(),
            ],
          ),
          Container(
            child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(
                    activeDotColor: Colors.black,
                    dotColor: Colors.black,
                    dotHeight: 5,
                    dotWidth: 5)),
            alignment: Alignment(0, 0),
          ),
          Container(
            child: Image(
              image:
                  AssetImage('assets/world-medical-card-removebg-preview.png'),
              height: 40,
            ),
            alignment: Alignment(0, -0.9),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: onLastPage
                  ? TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Hello();
                        }));
                      },
                      child: Container(
                        child: Text(
                          'NEXT',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),

                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 130),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.blue),
                        // color: Colors.blue,
                      )
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(30))
                      // ),
                      )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Hello();
                        }));
                      },
                      child: Text(
                        'Skip Tour',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
              alignment: Alignment(0, 0.8),
            ),
          )
        ],
      ),
    );
  }
}
