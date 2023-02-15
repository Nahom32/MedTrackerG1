import 'package:flutter/material.dart';

class IntroductionOne extends StatefulWidget {
  const IntroductionOne({Key? key}) : super(key: key);

  @override
  State<IntroductionOne> createState() => _IntroductionOneState();
}

class _IntroductionOneState extends State<IntroductionOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                image: AssetImage('assets/intro1.webp'),
                height: 150,
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Fill Your Info",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Your medical information is coded according to World Health Organizations global standards (ICD-10 ATC) to ensure that your condition and requirement is understood by health profesionals.',
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
