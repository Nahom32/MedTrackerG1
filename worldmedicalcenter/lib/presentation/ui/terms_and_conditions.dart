
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text('Terms and Conditions', style: TextStyle(fontSize: 30),),
            Text('Terms & Conditions'),
            Text('Updated at 2022-01-01'),
            Text('General Terms\n\n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi! Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi!\n'),
            Text('General Terms\n\n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi! Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi!\n'),
            Text('General Terms\n\n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi! Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi!\n'),
            Text('General Terms\n\n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi! Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi!\n'),
            Text('General Terms\n\n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi! Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi!\n'),
            Text('General Terms\n\n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi! Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid sed sapiente quam distinctio, doloribus veniam hic at corporis delectus. Sunt maxime voluptates consequuntur, iusto molestias recusandae excepturi eum quis nisi!\n'),
            Text('Contact Us\nDon\'t hesitate to contact us if you have any questions.\n \u2022 Via Email: post@wmc-card.no\n \u2022Via Phone Number: +47 55 33 75 75'),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}