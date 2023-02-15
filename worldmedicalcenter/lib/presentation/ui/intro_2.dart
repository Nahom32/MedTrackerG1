import 'package:flutter/material.dart';


class IntroductionTwo extends StatefulWidget {
  const IntroductionTwo({Key? key}) : super(key: key);

  @override
  State<IntroductionTwo> createState() => _IntroductionTwoState();
}

class _IntroductionTwoState extends State<IntroductionTwo> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:const Image(
              image: AssetImage('assets/intro2.webp'),
              height: 150,
              ),
              
            ),
              const SizedBox(height: 120,),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Travel Worry Free", 
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.all(20),
                    child: Text('You will have your own personal profile which can be accessed via app or browser. There is a build in translation function for 19 languages which will ase communication in relevant local terms.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54 ),
                    ),
                    ),
                ],
              ),
          ],
          
          )
          );
         
  }
}