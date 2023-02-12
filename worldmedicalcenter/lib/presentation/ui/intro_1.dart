import 'package:flutter/material.dart';

class IntroductionOne extends StatefulWidget {
  IntroductionOne({Key? key}) : super(key: key);

  @override
  State<IntroductionOne> createState() => _IntroductionOneState();
}

class _IntroductionOneState extends State<IntroductionOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage('assets/intro1.webp'),
                height: 150,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Text(
              "Fill Your Info",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Your medical information is coded according to World Health Organizations global standards (ICD-10 ATC) to ensure that your condition and requirement is understood by health profesionals.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ));
  }
}
