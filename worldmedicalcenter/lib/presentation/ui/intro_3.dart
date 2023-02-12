import 'package:flutter/material.dart';

class IntroductionThree extends StatefulWidget {
  IntroductionThree({Key? key}) : super(key: key);

  @override
  State<IntroductionThree> createState() => _IntroductionThreeState();
}

class _IntroductionThreeState extends State<IntroductionThree> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage('assets/intro3.webp'),
                height: 150,
                // width: 300,
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Column(
              children: [
                Text(
                  "Share Your Info",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'You can choose to share your profile with relatives, travel partner or others you trust, so that they can be able to provide you with first line of support.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
